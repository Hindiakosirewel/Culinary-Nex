<template>
    <div class="kitchen-container">
        <div class="kitchen-form-container">
            <form id="kitchenForm" @submit="handleSubmit" novalidate autocomplete="off">
                <h3>KITCHEN</h3>

                <div v-if="errors.length" class="error-box">
                    <ul>
                        <li v-for="error in errors" :key="error">{{ error }}</li>
                    </ul>
                </div>

                <div class="form-group">
                    <input type="password" id="uPass" name="uPass" class="form-control"
                        placeholder="enter kitchen password" v-model="kitchenObj.pass" />
                </div>

                <div class="form-group">
                    <input type="submit" value="kichen access" class="btn">
                </div>
            </form>
        </div>
    </div>
</template>


<script>
import { mapMutations } from "vuex";
export default {
    name: 'Kitchen',

    data() {
        return {
            kitchenObj: { pass: "" },
            key: "123456789",
            errors: [],
        }
    },

    methods: {
        ...mapMutations(["setKitchen"]),

        handleSubmit(e) {
            this.errors = [];
            if (!this.kitchenObj.pass) {
                this.errors.push('Password is required');
            }

            if (!this.errors.length == 0) {
                e.preventDefault();
            }
            else {
                e.preventDefault();
                if (this.key === this.kitchenObj.pass) {
                    this.setKitchen("kitchen");
                    this.$router.push("/kitchen/kdashboard");
                }
                else {
                    this.errors.push("Kitchen password wrong!")
                }

            }
        },
    handleLogout() {
        this.setKitchen("");
        this.$router.push("/kitchen");
    }, 
    },  
};
</script>

<style scoped>
.kitchen-container {
    padding: 2rem 9%;
}

.kitchen-container .kitchen-form-container {
    background-color: #fff;
    height: 100vh;
}

.kitchen-container .kitchen-form-container form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    max-width: 40rem;
    width: 100%;
    box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.05);
    border: 0.1rem solid rgba(0, 0, 0, 0.2);
    padding: 2rem;
    border-radius: .5rem;
    animation: fadeUp .4s linear;
}

.kitchen-container .kitchen-form-container form h3 {
    padding-bottom: 1rem;
    font-size: 2rem;
    font-weight: bolder;
    text-transform: uppercase;
    color: #130f40;
    margin: 0;
}

.kitchen-container .kitchen-form-container form .form-control {
    margin: .7rem 0;
    border-radius: .5rem;
    background: #f7f7f7;
    padding: 2rem 1.2rem;
    font-size: 1.6rem;
    color: #130f40;
    text-transform: none;
    width: 100%;
    border: none;
}

.kitchen-container .kitchen-form-container form .btn {
    margin-bottom: 1rem;
    margin-top: 1rem;
    width: 100%;
}

.kitchen-container .kitchen-form-container form p {
    padding-top: 1rem;
    font-size: 1.5rem;
    color: #666;
    margin: 0;
}

.kitchen-container .kitchen-form-container form p a {
    color: #27ae60;
}

.kitchen-container .kitchen-form-container form p a:hover {
    color: #130f40;
    text-decoration: underline;
}

.kitchen-container .kitchen-form-container form .error-box {
    background-color: #fff9fa;
    box-sizing: border-box;
    border: 2px solid rgba(255, 66, 79, .2);
    border-radius: 2px;
    font-size: 12px;
    margin-bottom: 20px;
}

.kitchen-container .kitchen-form-container form .error-box ul {
    list-style-type: none;
    margin: 0;
    padding: 10px 0px;
}

.kitchen-container .kitchen-form-container form .error-box ul li {
    padding-left: 10px;
    color: rgb(182, 0, 0);
}
</style>