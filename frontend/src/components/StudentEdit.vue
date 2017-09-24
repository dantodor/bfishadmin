<<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<main class="mdl-layout__content">
		<div class="mdl-card mdl-shadow--6dp">
			<div class="mdl-card__title mdl-color--primary mdl-color-text--white">
				<h2 class="mdl-card__title-text">Edit student details</h2>
			</div>
	  	<div class="mdl-card__supporting-text">
				<form action="#">
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> <strong>Username :</strong></div>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						
                        <input class="mdl-textfield__input" type="text" id="username" v-model="stnd.loginName"/>
						
					</div>
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> <strong>Password :</strong></div>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="userpass" v-model="stnd.password"/>
						
					</div>
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> <strong>First name :</strong></div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="fname" v-model="stnd.fname"/>
						
					</div>
					<div style = "background-color:#ddd; width: 100%; margin: 0 auto;"> <strong>Last name :</strong></div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="lname" v-model="stnd.lname"/>
						
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
import gql from 'graphql-tag'
import {mapActions} from 'vuex'

export default {
	computed: {
        activeStd() {
            return this.$store.state.activeStd
        }
    },
    data () {
        return {
			stnd: {}
        }
	},  
    methods: {
        saveClicked() {
			this.updateStudent(this.stnd)
			this.$router.push({name: 'class' })
		}
		,
		cancelClicked() {
            this.$router.push({name: 'class' })
		},
		...mapActions (
          [
              'updateStudent'
        ]
      )
	} ,
	created() {
		console.log("Got student with ID :"+this.activeStd.id)
		this.stnd = Object.assign({}, this.activeStd)
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

