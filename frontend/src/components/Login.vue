<<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<main class="mdl-layout__content">
		<div class="mdl-card mdl-shadow--6dp">
			<div class="mdl-card__title mdl-color--primary mdl-color-text--white">
				<h2 class="mdl-card__title-text">BrightFish Learning</h2>
			</div>
	  	<div class="mdl-card__supporting-text">
				<form action="#">
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="text" id="username" v-model="username"/>
						<label class="mdl-textfield__label" for="username">Username</label>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input class="mdl-textfield__input" type="password" id="userpass" v-model="password"/>
						<label class="mdl-textfield__label" for="userpass">Password</label>
					</div>
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
export default {
    data () {
        return {

            username: '',
            password: ''
        }
    }, 
    methods: {
        logClicked() {
            console.log(this.username)
            console.log(this.password)
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

