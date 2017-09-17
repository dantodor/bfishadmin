<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
	<main class="mdl-layout__content">
		<div class="mdl-grid">
            <div class="mdl-cell mdl-cell--6-col mdl-cell--4-col-phone">
                <div v-for="student in this.students">
                    <Student :std="student"></Student>
                </div>
            </div>
        </div>
    </main>
    <router-link class="add-picture-button mdl-button mdl-js-button mdl-button--fab mdl-button--colored" :to="{name: 'newst', params:{clss_id: cls_id,students: students}}">
      <i class="material-icons">add</i>
    </router-link>
  </div>

</template>
<script>

import Student from './Student'

  export default {
    components: {
        Student
    },
    props: ["students", "cls_id"],
    mounted() {
        this.$bus.$on('newStudentEvent', event => {
                console.log(event);
            });
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
    margin-bottom: 10px;
    margin-top: 10px;
    box-shadow: 6px;
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

