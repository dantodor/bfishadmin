<<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<main class="mdl-layout__content">
		<div class="mdl-card mdl-shadow--6dp">
			<div class="mdl-card__title mdl-color--primary mdl-color-text--white">
				<h2 class="mdl-card__title-text">New student</h2>
			</div>
	  	<div class="mdl-card__supporting-text">
				<form action="#">
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> Username :</div>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="username" v-model="student.loginName"/>
						
					</div>
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> Password :</div>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="userpass" v-model="student.password"/>
						
					</div>
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> First name :</div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="fname" v-model="student.fname"/>
						
					</div>
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> Last name :</div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="lname" v-model="student.lname"/>
						
					</div>
				</form>

			</div>
			<div class="mdl-card__actions mdl-card--border">
				<button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" @click="saveClicked">Save</button>
				<button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" @click="cancelClicked">Cancel</button>
			</div>
		</div>
	</main>
 </div>
</template>

<script>
import gql from 'graphql-tag';

export default {
    data () {
        return {
			student: {
				password: "",
				loginName: "",
				lname: "",
				fname: "",
				clss_id: parseInt(this.clss_id)
			},
			stnds: []

		}		
	}, 
	apollo: {
    	$client: 'a',
        $loadingKey: 'loading',
  	},
	props: ["clss_id",'students'],
    methods: {
        saveClicked() {
			this.$apollo.mutate({
      			// Query
      			mutation: gql`mutation CreateStudent($std: StudentInput!) {
					createStudent(input: $std) {
    					id
					}
      			}`,
      			// Parameters
      			variables: {
        			std: this.student
				  }
			}).then((data) => {
      			// Result
				  console.log("starting")
				  console.log(this.students)
				  var arrayLength = this.students.length;
				  for (var i = 0; i < arrayLength; i++){
					this.stnds.push(this.students[i])
				  }
				  console.log(this.stnds)
				  var a = this.student.clss_id.toString
				  this.student.clss_id = a
				  this.student.id = data.data.createStudent.id
				  console.log(this.student)
				  this.stnds.push(this.student)
    		}).catch((error) => {
      			// Error
				  console.error(error)
				  this.stnds = this.students
    		})
			this.$router.push({name: 'class', params: {students:this.stnds,clss_id:this.clss_id} })
			
		},
		cancelClicked() {
			this.$router.push({name: 'home' })
        }
	} 
}

</script>

<<style scoped >
.mdl-layout {
	    align-items: center;
        justify-content: center;
}
.mdl-layout__content {
	padding: 24px;
	flex: none;
}
</style>

