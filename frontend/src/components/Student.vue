<template>

			<div class="mdl-card card-lesson mdl-cell mdl-cell--4-col mdl-cell--2-col-phone mdl-shadow--16dp">
				<div class="mdl-card__media">
					<img src="../assets/student.png" alt=""/>
				</div>
				<div class="mdl-card__title">
					<h1 class="mdl-card__title-text mdl-color-text--light-blue-900">{{std.fname+' '+std.lname}}</h1>
				</div>
				<div class="mdl-grid">
					<div class="mdl-cell">
						<h3>Average {{std.average}}%</h3>
					</div>
					<div class="mdl-cell r-align">
						<span class="mdl-chip mdl-chip--contact">
							<span class="mdl-chip__contact mdl-color--light-blue mdl-color-text--white">{{std.stories}}</span>
							<span class="mdl-chip__text">Stories</span>
						</span>
						<span class="mdl-chip mdl-chip--contact">
							<span class="mdl-chip__contact mdl-color--teal mdl-color-text--white">{{std.totalHours}}</span>
							<span class="mdl-chip__text">Total hours</span>
						</span>
						<span class="mdl-chip mdl-chip--contact">
							<span class="mdl-chip__contact mdl-color--teal mdl-color-text--white">{{std.weekHours}}</span>
							<span class="mdl-chip__text">Week hours</span>
						</span>
					</div>
				</div>
				<div class="mdl-card__actions mdl-card--border">
    				<button class="mdl-button mdl-button--icon mdl-color-text--blue-grey-300" @click="editClicked">
						<i class="material-icons">edit</i>
					</button>
	  			</div>
			</div>
</template>

<script>
export default {
	props: ["std"],
	data() {
		return { 
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
.r-align {
	: left;
	padding-left: 60px;
}
.card-lesson {
  margin: 10px;
  min-width: 350px;
  min-height: 100px;
  & > .mdl-card__actions {
    display: flex;
    box-sizing: border-box;
    align-items: center;
  }
  & > .mdl-card__title {
    align-items: flex-start;
    & > h4 {
      margin-top: 0;
    }
  }
  & > .mdl-card__title,
  & > .mdl-card__supporting-text,
  & > .mdl-card__actions,
  & > .mdl-card__actions > .mdl-button {
    color: #fff;
  }
}

.mdl-card__media > img {
    width:100%;
	padding: 10px;
  }


</style>
