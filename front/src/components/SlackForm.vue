<template>
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
</template>

<script>
import {HTTP} from '../http-common';

export default {
  name: 'SlackForm',
  el: '#slack-form',
  data: () => ({
    webhook: '',
    text: '',
    errors: []
  }),
  methods: {
    processForm(event) {
      event.target.reset()
      const params = { type: 'slack', text: this.text, settings: { webhook: this.webhook } }
      HTTP.post('post', params).then(response => {}).catch(e => { this.errors.push(e) })
    }
  }
}
</script>

<style scoped>
.slack-box {
  background-color: green;
}
</style>
