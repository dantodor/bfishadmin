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
						<input class="mdl-textfield__input" type="text" id="clsname" v-model="clss.clssName"/>
						<label class="mdl-textfield__label" for="clsname">Class name</label>
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

export default {
    data () {
        return {
			clss: {
				clssName: ""
			}

		}		
    }, 
    methods: {
        saveClicked() {
            console.log(this.clss)
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

