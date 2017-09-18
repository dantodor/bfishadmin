<template>
  <div>
    <div class="mdl-grid">
      
       <div v-for="cl in this.clsses" class="image-card mdl-cell mdl-cell--4-col mdl-cell--4-col-phone mdl-shadow--16dp" @click="displayDetails(cl.students,cl.id)">
          <div class="image-card__picture">
            <img src="../assets/class1.png" />
          </div>
          <div class="image-card__comment mdl-card__actions">
            <span><strong>{{ cl.clssName }}</strong></span>
          </div>
        </div>
      
    </div>
    <router-link class="add-picture-button mdl-button mdl-js-button mdl-button--fab mdl-button--colored" to="/newcls">
      <i class="material-icons">add</i>
    </router-link>
  </div>

</template>
<script>
import data from '../data'
import gql from 'graphql-tag';

export default {
    methods: {
      displayDetails (s,i) {
        this.$router.push({name: 'class', params: {students:s, cls_id:i} })
      },
      getData() {
          //console.log(this.clsses)
          console.log(this.clsses)
          //this.cls = this.clsses
          //console.log(this.cls)
      }
    },
	apollo: {
    	$client: 'a',
        $loadingKey: 'loading',
        clsses: gql`{  
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
  	},
    data () {
      return {
            loggedIn: false,
            token: null,
            cls: data.clsses,
            clsses: ''
      }
    },
    created() {
        this.token = localStorage.getItem("token")
        if (!this.token) {
            this.loggedIn = false
            this.$router.push({name: 'login'})
        } else {
            this.getData()
        }
    },
    mounted() {
        this.$bus.$on('newClassEvent', event => {
                console.log(event);
                this.cls.push({
                    clssName: event.clssName,
                    students: []
                })
                console.log(this.cls)

            });
            this.$apollo.query({
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
            }).then((data) => {
                  // Result
                  //console.log(data)
                  this.clsses = data.data.clsses
                  console.log(this.clsses)
    		}).catch((error) => {
      			// Error
      			console.error(error)
    		})
    }
}
</script>

<style scoped>
  .add-picture-button {
    position: fixed;
    right: 24px;
    bottom: 24px;
    z-index: 998;
  }
  .image-card {
    position: relative;
    margin-bottom: 30px;
    margin-top: 10px;
    box-shadow: 6px;
	  width: 300px;
	  height: 350px;
  }
  .image-card__picture > img {
    width:100%;
  }
  .image-card__comment {
    position: absolute;
    bottom: 0;
    height: 52px;
    padding: 16px;
    text-align: right;
    background: rgba(0, 0, 0, 0.5);
  }
  .image-card__comment > span {
    color: #fff;
    font-size: 14px;
    font-weight: bold;
  }

</style>

