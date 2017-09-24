import Vue from 'vue';
import Vuex from 'vuex';
import apolloClient from '../apollo.js';

import gql from 'graphql-tag';

Vue.use(Vuex);


const store = new Vuex.Store({
	state: {
        clsses: [],
        activeCls: {},
        activeStd: {},
        i : 3,
        j : 2
	},
	mutations: {
		SET_CLASSES(state, clsses){
			state.clsses = clsses;
		},
		ADD_CLSS(state, clss){
            console.log('adding')
            state.clsses.push(clss);
            console.log(state.clsses)
            state.j = state.j+1
		},
		UPDATE_STUDENT(state, student){
            var s = state.activeCls.students.findIndex(el => el.id === student.id)
            var dummy = state.activeCls.students.splice(s,1,student);
            console.log('h')
            console.log(state.activeCls)
            state.clsses[state.clsses.findIndex(el => el.id === state.activeCls.id)]=state.activeCls
		},
		ADD_STUDENT(state, student){
            state.activeCls.students.push(student)
            state.clsses[state.clsses.findIndex(el => el.id === state.activeCls.id)]=state.activeCls
			state.i = state.i+1
        },
        SET_ACTIVE_CLS (state, clss) {
            state.activeCls = clss
        },
        SET_ACTIVE_STD (state, std) {
            state.activeStd = std
        }
	},
	actions: {
		getClsses(context){
            console.log("getting classes")
			apolloClient.query({
				query: gql`{  
                    clsses {
                        id
                        clssName
                        students {
                            id
                            fname
                            lname
                            loginName
                            password
                            average
                            totalHours
                            weekHours
                            stories
                        }
                    }
                }`
			}).then((result) => {
				context.commit('SET_CLASSES', JSON.parse(JSON.stringify(result.data.clsses)));
            });
        },
        updateActiveCls ({ commit }, cls)  {
            commit('SET_ACTIVE_CLS', cls)
        },
        updateActiveStd ({ commit }, std)  {
            commit('SET_ACTIVE_STD', std)
        },
        addClss ({ commit}, cls) {
            commit('ADD_CLSS',cls)
        },
        addStudent ({ commit}, std) {
            delete std['__typename']
            console.log(std)
            apolloClient.mutate({
      			// Query
      			mutation: gql`mutation CreateStudent($std: StudentInput!) {
					createStudent(input: $std) {
    					id
					}
      			}`,
      			// Parameters
      			variables: {
        			std: std
				  }
			}).then((data) => {
                std.id = parseInt(data.data.createStudent.id)
                commit('ADD_STUDENT',std)
    		}).catch((error) => {
      			// Error
				  console.error(error)
			})
            
        },
        updateStudent ({ commit}, std) {
            delete std['__typename']
            apolloClient.mutate({
      			// Query
      			mutation: gql`mutation UpdateStudent($std: StudentInput!) {
					updateStudent(input: $std) {
    					id
					}
      			}`,
      			// Parameters
      			variables: {
        			std: std
				  }
			}).then((data) => {
      			// Result
                  commit('UPDATE_STUDENT',std)
    		}).catch((error) => {
      			// Error
      			console.error(error)
			})

            
        }
	}
});

export default store;
