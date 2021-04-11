import axios from "axios";
const API = "http://localhost/aguitabackend/crud.php";

export default {
  post(opcion) {
    return axios.post(API, {opcion});
  }

};