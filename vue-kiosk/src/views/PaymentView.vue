<template>
    <div>
        <div class="wrap">

            <div class="title">
                <h1>결제 방식을 선택해 주세요</h1>
                <div class="titleLine"></div>

                <div class="paymentBtn">
                    <div class="mainPay">
                        <button>
                            <img src="../assets/img/payment/card.png">
                            <p>카드/삼성페이</p>
                        </button>
                        <button>
                            <img src="../assets/img/payment/mobale.png">
                            <p>모바일쿠폰</p>
                        </button>
                        <button>
                            <img src="../assets/img/pay/samsungpay.png">
                            <img src="../assets/img/pay/naverpay.png">
                            <img src="../assets/img/pay/kakaopay.png">
                            <p>다른결제수단</p>
                        </button>
                        <button>
                            <img src="../assets/img/pay/close.png" alt="">
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

export default {
    name: "PaymentView",
    components: {},
    data() {
        return {};
    },
    methods: {},
    created() { }
};
</script>

<style></style>