<<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<main class="mdl-layout__content">
		<div class="mdl-card mdl-shadow--6dp">
			<div class="mdl-card__title mdl-color--primary mdl-color-text--white">
				<h2 class="mdl-card__title-text">New student</h2>
			</div>
	  	<div class="mdl-card__supporting-text">
				<form action="#">
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="username" v-model="student.loginName"/>
						<label class="mdl-textfield__label" for="username">Username</label>
					</div>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="userpass" v-model="student.password"/>
						<label class="mdl-textfield__label" for="userpass">Password</label>
					</div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="fname" v-model="student.fname"/>
						<label class="mdl-textfield__label" for="fname">First name</label>
					</div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="lname" v-model="student.lname"/>
						<label class="mdl-textfield__label" for="lname">Last name</label>
					</div>
				</form>

			</div>
			<div class="mdl-card__actions mdl-card--border">
				<button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" @click="saveClicked">Save</button>
			</div>
		</div>
	</main>
 </div>
</template>

<script>
require('material-design-lite')

export default {
    data () {
        return {
			student: {
				password: "",
				loginName: "",
				lname: "",
				fname: "",
			}

		}		
    }, 
    methods: {
        saveClicked() {
			console.log(this.student)
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

