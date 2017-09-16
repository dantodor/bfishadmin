<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<main class="mdl-layout__content">
		<div class="mdl-grid">
			<div class="mdl-card mdl-cell mdl-cell--12-col mdl-cell--8-col-tablet mdl-shadow--16dp">
				<div class="mdl-card__media">
					<img src="../assets/student.png" alt="" style="padding:10px;"/>
				</div>
				<div class="mdl-card__title">
					<h1 class="mdl-card__title-text mdl-color-text--light-blue-900">{{std.fname+' '+std.lname}}</h1>
				</div>
				<div class="mdl-card__supporting-text">
					<h4>Average : {{std.average}}%</h4>
					<p><strong>Week hours : </strong> {{std.weekHours}}</p>
					<p><strong>Total hours : </strong> {{std.totalHours}}</p>
					<p><strong>Stories : </strong> {{std.stories}}</p>
				</div>
				<div class="mdl-card__actions mdl-card--border">
    				<a class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-color-text--light-blue-900">Read More</a>
    				<div class="mdl-layout-spacer"></div>
    				<button class="mdl-button mdl-button--icon mdl-color-text--blue-grey-300" @click="editClicked">
						<i class="material-icons">edit</i>
					</button>
	  			</div>
			</div>
		</div>
	</main>
</div>
</template>

<script>
export default {
	props: ["std"],
	data() {
		return { 
			// student: {
			// 	weekHours: 10,
			// 	totalHours: 45,
			// 	stories: 3,
			// 	password: "anagha",
			// 	loginName: "anagha",
			// 	lname: "Ramsaran",
			// 	fname: "Anagha",
			// 	average: 67
			// }
		}
	},
	methods: {
		editClicked() {
			this.$router.push({name: 'edits', params: {student:this.std} })
		}
	}

}  
</script>

<style scoped>
.mdl-grid {
	max-width: 320px;
	margin-top: 20px;
}
.mdl-card__media > img {
	max-width: 100%;
}
.mdl-card__actions {
	display: flex;
	box-sizing:border-box;
	align-items: center;
}
.mdl-card__actions > .mdl-button--icon {
	margin-right: 3px;
	margin-left: 3px;
}

</style>
