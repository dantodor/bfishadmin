<<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<main class="mdl-layout__content">
		<div class="mdl-card mdl-shadow--6dp">
			<div class="mdl-card__title mdl-color--primary mdl-color-text--white">
				<h2 class="mdl-card__title-text">BrightFish Learning</h2>
			</div>
	  	<div class="mdl-card__supporting-text">
				<form action="#">
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> Username :</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="text" id="username" v-model="username"/>
						
					</div>
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> Password :</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="password" id="userpass" v-model="password"/>
						
					</div>
					<div v-if="isError">{{errorMessage}}</div>
				</form>
			</div>
			<div class="mdl-card__actions mdl-card--border">
				<button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" @click="logClicked">Log in</button>
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
            username: '',
			password: '',
			isError: false,
			errorMessage: 'Incorrect username or password, try again'
        }
	},
	apollo: {
    	$client: 'a',
    	$loadingKey: 'loading',
  	},
    methods: {
        logClicked() {
            console.log(this.username)
			console.log(this.password)
			this.$apollo.mutate({
				// Query
				mutation: gql`mutation ($email: String!, $password: String!) {
					loginUser(email: $email, password: $password) {
							token
						}
					}`,
				// Parameters
				variables: {
				email: this.username,
				password: this.password
				}
			}).then((data) => {
				// Result
				console.log(data.data.loginUser.token);
				localStorage.setItem("token",data.data.loginUser.token)
				this.$router.push({name: 'home' })
			}).catch((error) => {
				// Error
				this.username=''
				this.password=''
				this.isError = true
				//alert('Incorrect username or password, try again')
				console.error(error);
		});
		
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

