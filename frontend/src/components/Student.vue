<<template>
			<div class="my-card mdl-card mdl-cell mdl-shadow--16dp">
				
                <div class = "mdl-grid mdl-card__supporting-text">
                    <div class = "mdl-cell mdl-cell--6-col">
                        <img src="../assets/userm.png" />
                    </div>
                    <div class = "mdl-cell mdl-cell--6-col">
                        <font size=4> <strong> {{std.fname}} {{std.lname}}</strong></font>
                        
                    </div>
                    <div class = "mdl-cell mdl-cell--6-col">
                        <radial-progress-bar :diameter="100"
                            :completed-steps="c_steps"
                            :total-steps="100" 
                            :start-color="startColor"
                            :stop-color="stopColor"
                            :inner-stroke-color="innerStroke" >
                            <p><strong>{{ c_steps }}%</strong></p>
                        </radial-progress-bar>
                    </div>
                    <div class = "mdl-cell mdl-cell--6-col">
                        <span class="mdl-chip mdl-chip--contact">
                                <span class="mdl-chip__contact mdl-color--light-blue mdl-color-text--white">
                                    {{c_stories}}
                                </span>
                                <span class="mdl-chip__text">Stories completed</span>
                        </span>
                        <span class="mdl-chip mdl-chip--contact">
                                <span class="mdl-chip__contact mdl-color--teal mdl-color-text--white">
                                    {{c_thours}}
                                </span>
                                <span class="mdl-chip__text">Total hours</span>
                        </span>
                        <span class="mdl-chip mdl-chip--contact">
                                <span class="mdl-chip__contact mdl-color--teal mdl-color-text--white">
                                    {{c_whours}}
                                </span>
                                <span class="mdl-chip__text">Week hours</span>
                        </span>

                    </div>
                </div>
				<div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-color-text--light-blue-900">Read More</a>
                    <div class="mdl-layout-spacer"></div>
                    <button class="mdl-button mdl-button--icon mdl-color-text--blue-grey-300" @click="editClicked">
                        <i class="material-icons">edit</i>
                    </button>
                    
                </div>
            </div>
</template>

<<script>

import RadialProgressBar from 'vue-radial-progress'
import {mapActions} from 'vuex'


export default {
    computed: {
        activeCls() {
            return this.$store.state.activeCls
        },
        c_stories() {
            var a = 0
            if(this.std.stories) 
                a=this.std.stories
            return a
        },
        c_thours() {
            var a = 0 
            if(this.std.totalHours) 
                a = this.std.totalHours
            return a
        },
        c_whours() {
            var a = 0 
            if(this.std.weekHours) 
                a = this.std.weekHours 
            return a
        },
        c_steps() {
            var a = 0 
            if(this.std.average) 
                a = this.std.average 
            return a
        }
    },
    props: ["std"],
    data () {
        return {
            startColor: '#4286f4',
            stopColor: '#4286f4',
            innerStroke: '#e8ecf2'
        }
    },
    components: {
        RadialProgressBar
    },
    methods: {
		...mapActions (
          [
              'updateActiveStd'
        ]
      ),
		editClicked() {
			this.updateActiveStd(this.std)
			this.$router.push({name: 'edits' })
		},
		
    },
    created() {
        switch(true) {
            case (this.std.average <= 50) : {
                this.startColor = '#f2352b'
                this.stopColor = '#ef8681'
                break;
            }
            case (this.std.average > 50 && this.std.average <= 75) :  {
                this.startColor = '#f9ee1b'
                this.stopColor = '#f7f28c'
                break;
            }
            default : {
                this.startColor = '#16f734'
                this.stopColor = '#9df2a8'
                break;    
            } 
        }
    }
}

</script>


<<style scoped>

.my-card.mdl-card {
            width: 310px;
            min-width: 310px;
            max-width: 310px;
}

.mdl-grid {
	margin-top: 2px;    
}
.mdl-cell {
    width:95px;
    min-width: 95px;
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

.mdl-chip {
  height: 32px;
  width: 140px;
  font-family: "Roboto", "Helvetica", "Arial", sans-serif;
  line-height: 32px;
  padding: 0 12px;
  border: 0;
  border-radius: 16px;
  background-color: #dedede;
  display: inline-block;
  color: rgba(0,0,0, 0.87);
  margin: 2px 0;
  font-size: 0;
  white-space: nowrap; 
  }

  .mdl-chip__contact {
    height: 32px;
    width: 32px;
    border-radius: 16px;
    display: inline-block;
    vertical-align: middle;
    margin-right: 10px;
    overflow: hidden;
    text-align: center;
    font-size: 18px;
    line-height: 32px; 
    }

</style>


