<template>
<div class="hero is-fullheight is-info is-bold">
<div class="hero-body">
<div class="container">
  <h1 class="title has-text-center">{{ message }}</h1>
  <div class="box slack-box">
    <!-- slack form -->
    <h2 class="title has-text-center">Slack</h2>
    <form id="slack-form" @submit.prevent="processForm">
      <!-- webhook -->
      <div class="field">
        <label class="label has-text-left">Webhook</label>
        <input type="text" class="input" name="webhook" v-model="webhook">
      </div>

      <!-- text -->
      <div class="field">
        <label class="label has-text-left">Message</label>
        <textarea type="text" class="textarea" rows="10" name="text" v-model="text" />
      </div>

      <!-- submit button -->
      <div class="field has-text-left">
        <button type="submit" class="button is-danger">Submit</button>
      </div>
    </form>
  </div>

</div>
</div>
</div>
</template>

<script>
import axios from 'axios';
import {HTTP} from '../http-common';

export default {
  name: 'Home',
  el: '#slack-form',
  data: () => ({
    webhook: '',
    text: '',
    errors: []
  }),
  props: {
    message: String
  },
  methods: {
    greet(event) {
      alert('Hello ' + this.message + '!')
      if (event) {
        alert(event.target.tagName)
      }
    },
    processForm() {
      axios.post(
        'http://127.0.0.1:8085/post',
        { type: 'slack', text: this.text, options: { webhook: this.webhook } },
        { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }
      ).then(response => {}).catch(e => { this.errors.push(e) })
    }
  }
}
</script>

<style scoped>
.slack-box {
  background-color: green;
}
</style>
