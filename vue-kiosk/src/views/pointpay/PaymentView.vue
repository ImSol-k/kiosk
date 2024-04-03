<template>
    <div>
        <div class="wrap">

            <!--header-->
            <AppHeader/>

            <div class="title">
                <h1>결제 방식을 선택해 주세요</h1>
                <div class="titleLine"></div>

                <div class="paymentBtn">
                    <div class="mainPay">
                        <button v-on:click.prevent="paySave('card')">
                            <img src="../../assets/img/payment/card.png">
                            <p>카드/삼성페이</p>
                        </button>
                        <button v-on:click.prevent="paySave('cupon')">
                            <img src="../../assets/img/payment/mobale.png">
                            <p>모바일쿠폰</p>
                        </button>
                        <button v-on:click.prevent="paySave('pay')">
                            <img src="../../assets/img/pay/samsungpay.png">
                            <img src="../../assets/img/pay/naverpay.png">
                            <img src="../../assets/img/pay/kakaopay.png">
                            <p>다른결제수단</p>
                        </button>
                        <button>
                            <img src="../../assets/img/pay/close.png" alt="">
                            <p>결제취소</p>
                        </button>
                    </div><!--mainPay-->

                </div>
            </div><!--title-->

        </div><!--wrap-->
    </div>
</template>
<script>
import '@/assets/css/attention.css'
import '@/assets/css/payment.css'
import AppHeader from '../components/AppHeader.vue'

export default {
    name: "PaymentView",
    components: {
        AppHeader
    },
    data() {
        return {
        };
    },
    methods: {
        paySave(pay){
            console.log("결제방식: " + pay);
            this.$router.push("/pointsave");
            this.$store.commit("setPay", pay);
        }
    },
    created() { 
        let list = [
                {no: 1, name: "아메리카노", count: 2, price: "3000"},
                {no: 2, name: "라떼", count: 1, price: "3500"}
            ]
            
        this.$store.commit("setCartList", list);
        this.$store.commit("setTotal", 4000);
    }
};
</script>

<style></style>