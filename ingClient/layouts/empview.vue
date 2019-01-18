<template>
    <v-app>
        <v-navigation-drawer fixed v-model="drawer" app>
            <v-list dense>
                <v-list-tile>
                    <nuxt-link to="/">
                        <v-icon>home</v-icon>
                    </nuxt-link>
                    <v-list-tile-content>
                        <v-list-tile-title>Home</v-list-tile-title>
                    </v-list-tile-content>
                </v-list-tile>
                <v-list-tile v-for = "(menu,index) in Page.Menu" :key="index">
                    <v-list-tile-action>
                        <v-icon>menu</v-icon>
                    </v-list-tile-action>
                    <v-list-tile-content>
                        <nuxt-link :to="menu.value"> 
                            <v-list-tile-title>{{menu.text}}</v-list-tile-title>
                        </nuxt-link>
                    </v-list-tile-content>
                </v-list-tile>
            </v-list>
        </v-navigation-drawer>
        <v-toolbar app>
            <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title>{{Page.Name}}</v-toolbar-title>
        </v-toolbar>
        <v-content>
            <v-container fluid>
                <router-view></router-view>
            </v-container>
            
        </v-content>
        <v-footer app>
        
        </v-footer>
    </v-app>
</template>
<style>

</style>

<script>
export default {
  data() {
      return {
        drawer: false,
        Page:[]
      }
  },
  async created() {
    console.log('Xapp created')
    let res = await this.$http.get('/page/emp/'+this.$route.params.empid)
    console.log('/page/emp/'+this.$route.params.empid);
    console.log(res.data)
    this.Page = res.data;
    console.log(this.Page.Name)
  }
}
</script>