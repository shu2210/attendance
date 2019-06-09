<template>
  <table class="striped">
    <thead>
      <tr>
        <th>日付</th>
        <th>出勤時間</th>
        <th>退勤時間</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="log in logs">
        <td>{{ log.date }}</td>
        <td>{{ log.start_at | timeFormat }}</td>
        <td>{{ log.end_at | timeFormat }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import moment from 'moment'
import axios from 'axios'

export default {
  data: function () {
    return {
      logs: []
    }
  },
  filters: {
    timeFormat: function (value) {
      return moment(value).format('HH:mm:ss')
    }
  },
  mounted: function () {
    this.fetchLogs();
  },
  methods: {
    fetchLogs: function () {
      axios.get('/working/list').then((response) => {
        for(var i=0; i<response.data.logs.length; i++) {
          this.logs.push(response.data.logs[i]);
        }
      }, (error) => {
        console.log(error);
      });
    }
  }
}
</script>
