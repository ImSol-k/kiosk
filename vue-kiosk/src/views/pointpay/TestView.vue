<template>
    <div class="wrap">
        <header class="chartMainHeader">
            <router-link to="/setting" class="home"><img src="">
            </router-link>
            <router-link to="/setting" class="logoImg"><img src=""></router-link>
            <ul>

                <li><router-link to="">메뉴등록</router-link></li>
                <li><router-link to="/chart/main">총매출</router-link></li>
                <li><router-link to="/chart/coffeeview">카테고리매출</router-link></li>

            </ul>
        </header>

        <h1>메뉴 등록</h1>
        <form v-on:submit.prevent="menuInsert" class="insertMenuBox" action="">
            <div class="textBox">
                <label for="menuName">메뉴명</label>
                <input type="text" name="menuName" id="menuName" v-model="productVo.name">

                <label for="menuPrice">가격</label>
                <input type="text" name="menuPrice" id="menuPrice" v-model="productVo.price">원
            </div>

            <div class="categoryBox">
                <label for="category">카테고리</label>
                <select v-model="productVo.category" class="category" id="category">
                    <option disabled>카테고리 선택</option>
                    <option>커피</option>
                    <option>논커피</option>
                    <option>밀크쉐이크</option>
                    <option>스무디/프라페</option>
                    <option>디저트</option>
                </select>
            </div>
            <button class="submitBtn" type="submit">등록</button>
        </form>

        <div class="listBox">
            <h1>메뉴 리스트</h1>
            <table>
                <colgroup>
                    <col style="width: 50px;">
                    <col style="width: 150px;">
                    <col style="width: 270px;">
                    <col style="width: 200px;">
                    <col style="width: 60px;">
                    <col style="width: 60px;">
                    <col style="width: 50px;">
                </colgroup>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>카테고리</th>
                        <th>메뉴</th>
                        <th>가격</th>
                        <th>삭제</th>
                        <th>수정</th>
                        <th>이미지</th>
                    </tr>
                </thead>
                    <tbody v-bind:key="i" v-for="(productVo, i) in menuList">
                        <tr v-if="productVo.no != modifyNo">
                            <td>{{ productVo.no }}</td>
                            <td>{{ productVo.category }}</td>
                            <td>{{ productVo.name }}</td>
                            <td>{{ productVo.price }}</td>
                            <td>
                                <button v-on:click.prevent="menuDelete(productVo.no, i)" class="modifyBtn">삭제</button>
                            </td>
                            <td>
                                <button class="modifyBtn" v-on:click="modifyMenu(productVo.no)">수정</button>
                            </td>
                            <td>
                                <button v-on:click.prevent="imgModal(productVo.no, productVo.name)"
                                    class="modifyBtn">등록</button>
                            </td>
                        </tr>

                        <tr v-else>

                            <td>{{ productVo.no }}</td>
                            <td>
                                <select v-model="productVo.category" class="category" id="category">
                                    <option disabled>카테고리 선택</option>
                                    <option>커피</option>
                                    <option>논커피</option>
                                    <option>밀크쉐이크</option>
                                    <option>스무디/프라페</option>
                                    <option>디저트</option>
                                </select>
                            </td>
                            <td><input type="text" name="category" id="" v-model="productVo.name"></td>
                            <td><input type="text" name="category" id="" v-model="productVo.price"></td>
                            <td>
                                <button></button>
                            </td>
                            <td>
                                <button class="modifyBtn" v-on:click.prevent="modifyUpload(productVo)">완료</button>
                            </td>
                            <td>
                                <button v-on:click.prevent="imgModal(productVo.no, productVo.name)"
                                    class="modifyBtn">등록</button>
                            </td>
                        </tr>
                    </tbody>
            </table>
        </div>

    </div> <!--//wrap-->
    <div class="imgModalBox" v-show="modalOpen" v-on:click="closeModal">
        <div class="imgModal">
            <h1>이미지 등록</h1>

            <div class="textbox">
                <span>제품번호</span>
                <span>{{ productVo.no }}</span>

                <span>제품명</span>
                <span>{{ productVo.name }}</span>
            </div>

            <form action="">
                <input type="file" name="" id="">
                <div>
                    <button type="submit" class="modifyBtn">등록</button>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
import "@/assets/css/attention.css"
//import "@/assets/css/ManagerView.css"

import axios from 'axios';

export default {
    name: "ManagerView",
    components: {},
    data() {
        return {
            menuList: [
                { no: 1, name: "아메리카노", price: 3000, category: "커피"},
                { no: 2, name: "라떼", price: 3000, category: "커피"},
                { no: 3, name: "카페모카", price: 3000, category: "커피"},
            ],
            productVo: {
                no: "",
                name: "",
                price: "",
                category: ""
            },
            modalOpen: false,
            modifyNo: ""
        };
    },
    methods: {
        getList() {
            console.log("리스트 불러오기");

            axios({
                method: 'get', // put, post, delete
                url: 'http://localhost:9000/api/managers/list',
                headers: { "Content-Type": "application/json; charset=utf-8" }, //전송타입
                //params: guestbookVo, //get방식 파라미터로 값이 전달
                //data: guestbookVo, //put, post, delete 방식 자동으로 JSON으로 변환 전달
                responseType: 'json' //수신타입
            }).then(response => {
                console.log(response.data); //수신데이타
                this.menuList = response.data;

            }).catch(error => {
                console.log(error);
            });
        },
        menuInsert() {
            console.log("메뉴 등록");

            axios({
                method: 'post', // put, post, delete
                url: 'http://localhost:9000/api/managers/list',
                headers: { "Content-Type": "application/json; charset=utf-8" }, //전송타입
                //params: guestbookVo, //get방식 파라미터로 값이 전달
                data: this.productVo, //put, post, delete 방식 자동으로 JSON으로 변환 전달
                responseType: 'json' //수신타입
            }).then(response => {
                console.log(response); //수신데이타
                console.log(this.productVo); //수신데이타

                this.productVo.name = "";
                this.productVo.price = "";
                this.productVo.category = "";

                this.getList();

            }).catch(error => {
                console.log(error);
            });
        },
        menuDelete(no, i) {
            console.log("메뉴 삭제" + no);
            axios({
                method: 'delete', // put, post, delete
                url: 'http://localhost:9000/api/managers/list/' + no,
                headers: { "Content-Type": "application/json; charset=utf-8" }, //전송타입
                //params: guestbookVo, //get방식 파라미터로 값이 전달
                data: this.productVo.no, //put, post, delete 방식 자동으로 JSON으로 변환 전달
                responseType: 'json' //수신타입
            }).then(response => {
                console.log(response); //수신데이타

                //삭제가 정상적으로 완료
                if (response.data.result == "success" && response.data.apiData == "삭제완료") {
                    alert("삭제가 완료되었습니다\n(삭제할 이미지가 없습니다.)");
                    this.menuList.splice(i, 1); //화면에서 삭제
                } else if (response.data.result == "success" && response.data.apiData == "이미지") {
                    alert("삭제가 완료되었습니다");
                    this.menuList.splice(i, 1); //화면에서 삭제
                } else { //삭제 실패시
                    alert("삭제실패");
                }

            }).catch(error => {
                console.log(error);
            });
        },
        selectFile(event) {
            console.log("파일선택");
            this.file = event.target.files[0];

        },
        imgModal(no, name) {
            console.log("이미지 등록 모달창 오픈");
            this.modalOpen = true;
            this.productVo.no = no;
            this.productVo.name = name;

        },
        closeModal() {
            console.log("이미지 등록 모달창 닫기");
            this.modalOpen = false;
        },
        uploadFile(no) {
            console.log("파일업로드" + no);

            //서버에 전송할 형태(여러개 담을 수 있음)
            let formData = new FormData();
            formData.append("file", this.file);
            formData.append("no", this.no);
            // data로 보낸다(json 방식이 아님)

            axios({
                method: 'post', // put, post, delete
                url: 'http://localhost:9000/api/managers/attach',
                headers: { "Content-Type": "multipart/form-data" }, //전송타입
                //params: guestbookVo, //get방식 파라미터로 값이 전달 - modelattribute로 받아야함
                data: formData, //put, post, delete 방식 자동으로 JSON으로 변환 전달 -requestbody로 받아야함
                responseType: 'json' //수신타입
            }).then(response => {
                console.log(response); //수신데이타
                console.log(response.data.apiData); //수신데이타

            }).catch(error => {
                console.log(error);
            });
        },
        modifyMenu(no) {
            console.log("수정버튼");
            console.log(no);
            this.modifyNo = no;
        },
        modifyUpload(pVo) {
            console.log("수정완료");
            console.log(pVo);
            this.modifyNo = "";
        }
    },
    created() {
        this.getList();
    }
};
</script>