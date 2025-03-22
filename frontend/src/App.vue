<template>
    <div id="app">
        <div v-if="admin || kitchen">
            <router-view></router-view>
        </div>
        <div v-else>
            <NavBar v-if="!isAdminLoginPage && !isKitchenPage" />

            <div class="auth-wrapper">
                <div class="auth-inner">
                    <router-view></router-view>
                </div>
            </div>
            <FooterComponent />
        </div>
    </div>
</template>

<script>
import NavBar from './components/NavBar.vue';
import FooterComponent from './components/FooterComponent.vue';
import { mapActions } from 'vuex';
import { mapState } from 'vuex';
export default {
    name: 'App',
    components: {
        NavBar,
        FooterComponent
    },

    computed: {
        ...mapState(["admin", "kitchen"])
    },
    data(){
        return {
            isAdminLoginPage: false,
            isKitchenPage: false,
        };
    },
    watch: {
        $route(to) {
            this.isAdminLoginPage = to.name === "Admin" || to.name === "Dashboard";
            this.isKitchenPage = to.name === "Kitchen" || to.name === "KDashboard";
        }
    },
    created() {
        this.getFoodsData()
    },
    methods: {
        ...mapActions(["getFoodsData"])
    }
}
</script>

<style>
@import "./assets/css/global_style.css";
</style>

