<template>
  <v-container grid-list-xl>
    <v-layout flex-child wrap>
      <v-flex xs12 md4 d-flex>
        <v-sheet class="d-flex" color="grey lighten-3" height="454">


          <sheet-footer> #1: (3r x 2c) </sheet-footer>
        </v-sheet>
      </v-flex>

      <v-flex xs12 md4 d-flex>
        <v-layout wrap>
          <v-flex xs6>
            <v-sheet class="d-flex" color="green lighten-3" height="150" >
              <sheet-footer>
                #2: (1r x 1c)
              </sheet-footer>
            </v-sheet>
          </v-flex>
          <v-flex xs6>
            <v-sheet
              class="d-flex"
              color="yellow lighten-3"
              height="150"
            >
              <sheet-footer>
                #3: (1r x 1c)
              </sheet-footer>
            </v-sheet>
          </v-flex>
          <v-flex xs12>

            <v-sheet
              class="d-flex"
              color="red lighten-3"
              height="250"
            >
              <sheet-footer>
                #5: (2r x 2c)
              </sheet-footer>
            </v-sheet>
          </v-flex>
        </v-layout>
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