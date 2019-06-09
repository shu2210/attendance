<template>
  <div class="row">
    <div class="col s12">
      <div class="card center-align">
        <div class="card-content">
          <time class="current-time">{{ current_time | timeFormat }}</time>
          <button class="waves-effect waves-light btn" v-on:click="startWorkingTime">出勤</button>
          <button class="waves-effect waves-light btn">退勤</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import axios from 'axios'

export default {
  data() {
    return {
      current_time: moment()
    }
  },
  mounted: function () {
    setInterval(()=>{
      this.current_time = moment()
    },1000)
  },
  filters: {
    timeFormat: function (value) {
      return value.format('HH:mm:ss')
    }
  },
  methods: {
    startWorkingTime: function () {
      axios.post('/working/start').then((response) => {
      }, (error) => {
        console.log(error);
      });
    }
  }
}
</script>

<style scoped>
.current-time {
  display: block;
  margin: 10px 0;
  font-size: 5.0em;
}
</style>
