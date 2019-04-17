<template>
<div class="hero is-fullheight is-info is-bold">
<div class="hero-body">
<div class="container">

  <h1 class="title has-text-centered">{{ message }}</h1>
  <div class="box">
    <!-- slack form -->
    <form id="signup-form">
      <!-- name -->
      <div class="field">
        <label class="label">Name</label>
        <input type="text" class="input" name="name">
      </div>

      <!-- email -->
      <div class="field">
        <label class="label">Email</label>
        <input type="email" class="input" name="email">
      </div>

      <!-- submit button -->
      <div class="field has-text-right">
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
  data: () => ({
    postBody: 'empty',
    errors: [],
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
    postPost() {
      axios.post(`http://127.0.0.1:8085`, { body: this.postBody })
        .then(response => {})
        .catch(e => { this.errors.push(e) })
    }
  }
}
</script>

<style scoped>
.slack {
  background-color: green;
}
</style>
