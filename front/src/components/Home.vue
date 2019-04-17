<template>
<div class="hero is-fullheight is-info is-bold">
<div class="hero-body">
<div class="container">
  <h1 class="title has-text-center">{{ message }}</h1>
  <SlackForm />
  <TelegramForm />
</div>
</div>
</div>
</template>

<script>
import TelegramForm from './TelegramForm'
import SlackForm from './SlackForm'

export default {
  name: 'Home',
  props: {
    message: String
  },
  components: {
    TelegramForm,
    SlackForm
  }
}
</script>
