<template>
  <div class="mdl-layout mdl-js-layout mdl-color--grey-100">
    <main class="mdl-layout__content">
        <div class="mdl-grid">           
                <div v-for="student in this.activeCls.students">
                    <Student :std="student"></Student>
                </div>
        </div>
    </main>
    <router-link class="add-picture-button mdl-button mdl-js-button mdl-button--fab mdl-button--colored" :to="{name: 'newst'}">
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
    computed: {
        activeCls() {
            return this.$store.state.activeCls
        }
    }
  }
</script>

<style scoped>

  .add-picture-button {
    position: fixed;
    right: 24px;
    bottom: 74px;
    z-index: 998;
  }
  
</style>

