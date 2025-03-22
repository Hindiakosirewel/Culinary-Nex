<template>
    <div class="kitchen-container">
        <div class="d-flex justify-content-between">
            <h1>CulinaryNex Kitchen!</h1>
            <button class="btn" @click="handleLogout()">Logout</button>
        </div>

        <div class="table-responsive">
            <!-- PROJECT TABLE -->
            <table class="table colored-header datatable project-list">
                <thead>
                    <tr>
                        <th>Order No</th>
                        <th>User Id</th>
                        <th>Phone</th>
                        <th>Name</th>
                        <th>Order Date & Time</th>
                        <th>Paid</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Order</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(b) in filterBills.slice().reverse()" :key="b.bill_id">
                        <td>{{ b.bill_id }}</td>
                        <td>{{ b.user_id }}</td>
                        <td>{{ b.bill_phone }}</td>
                        <td>{{ b.bill_address }}</td>
                        <td>{{ b.bill_when }}</td>
                        <td>{{ b.bill_paid }}</td>
                        <td>₱{{ b.bill_total }}</td>
                        <td>{{ avaiableStatus[b.bill_status] }}</td>
                        <td><button @click="sendBillId(b.bill_id)">view</button>
                        </td>
                        <td>
                            <button v-if="b.bill_status === 2" class="action-btn" @click="nextStatusBtn(b.bill_id)">
                                {{ avaiableStatus[b.bill_status + 1] }}
                            </button>
                            
                            <button v-if="b.bill_status === 3" class="action-btn" @click="nextStatusBtn(b.bill_id)">
                                {{ avaiableStatus[b.bill_status + 1] }}
                            </button>

                            <button v-if="b.bill_status === 4" class="action-btn" @click="nextStatusBtn(b.bill_id)">
                                {{ avaiableStatus[b.bill_status + 1] }}
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <OrderDetails v-if="showOrderDetails" :bill="sendId">
            <button class="btn" @click="closeView">X</button>
        </OrderDetails>
    </div>
</template>


<script>
import axios from "axios";
import { mapState, mapMutations } from "vuex";
import OrderDetails from "@/components/OrderDetails.vue";
import { useRouter } from 'vue-router';

export default {
    name: 'Dashboard',

    data() {
        return {
            avaiableStatus: ["cancel", "pending", "confirmed", "preparing", "now serving", "served"],
            allBills: [],
            showOrderDetails: false,
            sendId: undefined,
            interval: "",
        }
    },

    created() {
        this.getAllBills();
        if (!this.kitchen) {
            this.$router.push("/");
        }
    },

    mounted: function () {
        this.autoUpdate();
    },

    beforeUnmount() {
        clearInterval(this.interval)
    },

    computed: {
        ...mapState(["allFoods", "kitchen"]),

        filterBills: function () {
            return this.allBills.filter((b) => b.bill_status < 6 && b.bill_status > 0);
        },
    },

    methods: {
        ...mapMutations(["setKitchen"]),

        async getAllBills() {
            this.allBills = (await axios.get('/billstatus')).data;
        },

        handleLogout: function () {
            const router = useRouter ();
            this.setKitchen("");
            console.log("Kitchen logged out. Kitchen state:", this.kitchen);
            router.push("/kitchen");
        },

        async nextStatusBtn(id) {
            await axios.put('/billstatus/' + id);
            this.getAllBills();
        },

        async paidBtn(id) {
            await axios.put('/billstatus/paid/' + id);
            this.getAllBills();
        },

        async cancelBtn(id) {
            await axios.put('/billstatus/cancel/' + id);
            this.getAllBills();
        },

        sendBillId: function (id) {
            this.sendId = id
            this.showOrderDetails = !this.showOrderDetails;
        },

        closeView: function () {
            this.showOrderDetails = !this.showOrderDetails;
        },

        autoUpdate: function () {
            this.interval = setInterval(function () {
                this.getAllBills();
            }.bind(this), 1000);
        }
    },
    components: { OrderDetails }
}
</script>

<style scoped>

.kitchen-container {
    background-color: #fff;
    height: 100vh;
    padding: 2rem 9%;
    font-size: 16px;
}

.project-list>tbody>tr>td {
    padding: 12px 8px;
}

.project-list>tbody>tr>td .avatar {
    width: 22px;
    border: 1px solid #CCC;
}

.colored-header thead { 
    background-color: #27ae60; 
    color: white; 
}

.table-responsive {
    margin-top: 8vh;
}

.action-btn,
.cancel-btn,
.paid-btn {
    width: 100px;
    height: 25px;
    color: white;
    text-transform: capitalize;
}

.action-btn {
    background-color: #0da9ef;
    margin-right: 10px;
}

.cancel-btn,
.paid-btn {
    background-color: #27ae60;
}

.action-btn:hover {
    background-color: #27ae60;
}
</style>