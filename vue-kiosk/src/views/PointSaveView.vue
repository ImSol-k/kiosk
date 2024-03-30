<template>
    <div>
        <div class="wrap">
            <div class="title">
                <h1>포인트 적립</h1>
            </div><!--title-->

            <form action="">
                <div class="hpInput">
                    <h2>핸드폰번호를 입력해주세요</h2>
                    <p class="showHp">{{ temp }}</p>
                    <div class="hpBtn">
                        <span v-for="(num, i) in 9" :key="i">
                            <button type="button" v-on:click="hpInput(num)">{{ num }}</button>
                            <span v-if="num % 3 == 0"><br></span>
                        </span>
                        <div class="hplastBtn">
                            <button type="button" v-on:click="hpInput(0)">0</button>
                            <button type="button" v-on:click="hpInput(-1)">지우기</button>
                        </div>
                    </div><!--hpBtn-->
                </div><!--hpInput-->

                <div class="pointBtn">
                    <button>적립취소</button>
                    <button type="submit">적립</button>
                </div>
            </form>

        </div><!--wrap-->
    </div>
</template>
<script>
import '@/assets/css/attention.css'
import '@/assets/css/payment.css'

export default {
    name: "PointSaveView",
    components: {},
    data() {
        return {
            temp: "",   //화면에 보여지는 핸드폰번호
            userVo: {
                hp: ""  //데이터로 넘길 핸드폰번호
            }
        };
    },
    methods: {
        hpInput(no) {
            console.log('번호클릭' + no);

            //입력받은수가 -1이면 삭제
            if (no == -1) {
                let del = this.temp.charAt(this.temp.length - 2);
                console.log("삭제" + del);

                if (del == "-") {
                    this.temp = this.temp.slice(0, -2);
                } else {
                    this.temp = this.temp.slice(0, -1);
                }
                
            } else {
                //저장된 숫자의 길이가 핸드폰번호길이(11)보다 짧으면저장
                if (this.temp.length < 13) {
                    //하이픈 추가
                    if (this.temp.length === 3 || this.temp.length === 8) {
                        this.temp += "-";
                    }
                    this.temp += no;
                }
            }




            //넘길데이터에는 하이픈 빼주기
            this.userVo.hp = this.temp.replace(/-/g, "");
            console.log("temp: " + this.temp);
            console.log("hp: " + this.userVo.hp);
        }
    },
    created() { }
};
</script>

<style></style>