<template>
  <v-container grid-list-xl>
    <v-layout flex-child wrap>
      <v-flex xs12 md4 d-flex>
        <v-sheet class="d-flex" color="grey lighten-3" height="454">
            

          <sheet-footer></sheet-footer>
        </v-sheet>
      </v-flex>
      
      <v-flex xs12 md8 d-flex>
        <v-sheet class="d-flex" color="grey lighten-3" height="454">


          <sheet-footer></sheet-footer>
        </v-sheet>
      </v-flex>

     
    </v-layout>
  </v-container>
</template>
<script>
export default {
 layout: 'empview',
 data() {
    return {
      userid: this.$route.params.empid
    }
  }
}
</script>
<style>
.con-center {
  text-align: center;
  margin-top: 1rem;
}
</style>