<template>
  <div>
    <div class="mdl-grid">
      
       <div v-for="cl in this.clsses" class="image-card mdl-cell mdl-cell--4-col mdl-cell--4-col-phone mdl-shadow--16dp" @click="displayDetails(cl)">
          <div class="image-card__picture">
            <img src="../assets/class_256.png" />
          </div>
          <div class="image-card__comment mdl-card__actions">
            <span><strong>{{ cl.clssName }}</strong></span>
          </div>
        </div>
      
    </div>
    <router-link class="add-picture-button mdl-button mdl-js-button mdl-button--fab mdl-button--colored" to="/newcls">
      <i class="material-icons">add</i>
    </router-link>
  </div>

</template>
<script>
import gql from 'graphql-tag';
import {mapActions} from 'vuex'

export default {
    computed: {
        clsses () {
            return this.$store.state.clsses
        },
        activeCls() {
            return this.$store.state.activeCls
        }
    },
    methods: {
      displayDetails (clss) {
        this.updateActiveCls(clss)
        this.$router.push({name: 'class'})
      },
      ...mapActions (
          [
              'updateActiveCls',
              'getClsses'
        ]
      )
    },
    data () {
      return {
            loggedIn: false,
            token: null
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
  .image-card {
    position: relative;
    margin-bottom: 30px;
    margin-top: 10px;
    box-shadow: 6px;
	  width: 300px;
	  height: 350px;
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

