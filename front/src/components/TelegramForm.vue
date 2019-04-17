<template>
  <div class="box telegram-box">
    <!-- slack form -->
    <h2 class="title has-text-center">Telegram</h2>
    <form id="slack-form" @submit.prevent="processForm">
      <!-- webhook -->
      <div class="field">
        <label class="label has-text-left">Client ID</label>
        <input type="text" class="input" name="clientId" v-model="clientId">
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
  name: 'TelegramForm',
  el: '#slack-form',
  data: () => ({
    clientId: '',
    text: '',
    errors: []
  }),
  methods: {
    processForm(event) {
      event.target.reset()
      const params = { type: 'telegram', text: this.text, settings: { client_id: this.clientId } }
      HTTP.post('post', params).then(response => {}).catch(e => { this.errors.push(e) })
    }
  }
}
</script>

<style scoped>
.telegram-box {
  background-color: grey;
}
</style>
