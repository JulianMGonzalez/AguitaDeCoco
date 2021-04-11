<template>
  <v-container>
    <v-main>
      <v-data-table
        :headers="headers"
        :items="productos"
        sort-by="calories"
        class="elevation-1"
        :loading="cargando"
        loading-text="Cargando... espera"
        :search="search"
      >
        <template v-slot:top>
          <v-toolbar flat>
            <v-toolbar-title>CRUD aguita de coco</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-text-field
              v-model="search"
              append-icon="mdi-magnify"
              label="Search"
              single-line
              hide-details
            ></v-text-field>
            <v-spacer></v-spacer>
            <v-dialog v-model="dialog" max-width="500px">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="primary"
                  dark
                  class="mb-2"
                  v-bind="attrs"
                  v-on="on"
                >
                  Agregar producto
                </v-btn>
              </template>
              <v-card>
                <v-card-title>
                  <span class="headline">{{ formTitle }}</span>
                </v-card-title>

                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.nombre"
                          label="Nombre"
                          solo
                          rounded
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-textarea
                          v-model="editedItem.descripcion"
                          label="Descripcion"
                          solo
                          rounded
                        ></v-textarea>
                      </v-col>
                      <v-col cols="12">
                        <v-textarea
                          v-model="editedItem.imagen"
                          label="Imagen"
                          solo
                          rounded
                        ></v-textarea>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.precio"
                          label="Precio"
                          solo
                          rounded
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.stock"
                          label="Stock"
                          solo
                          rounded
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.descuento"
                          label="Descuento"
                          solo
                          rounded
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="editedItem.estado"
                          label="estado"
                        ></v-text-field>
                      </v-col>
                    </v-row>
                  </v-container>
                </v-card-text>

                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="close"
                    >Cancelar
                  </v-btn>
                  <v-btn color="blue darken-1" text @click="editar">
                    Guardar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
            <v-dialog v-model="dialogDelete" max-width="500px">
              <v-card>
                <v-card-title class="headline"
                  >Seguro quieres cambiar de estado este elemento?</v-card-title
                >
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="closeDelete"
                    >Cancel</v-btn
                  >
                  <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                    >OK</v-btn
                  >
                  <v-spacer></v-spacer>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-toolbar>
        </template>
        <template v-slot:[`item.imagen`]="{ item }">
          <div class="p-2">
            <v-img :src="item.imagen" height="50px" width="50px"></v-img>
          </div>
        </template>
        <template v-slot:[`item.actions`]="{ item }">
          <v-icon medium class="mr-2" @click="editItem(item)" color="orange">
            mdi-pencil
          </v-icon>
          <v-icon medium @click="deleteItem(item)" color="green">
            <template v-if="item.estado == 1"> mdi-swap-vertical</template>
            <template v-else>mdi-swap-horizontal</template>
          </v-icon>
        </template>
        <template v-slot:no-data>
          <v-btn color="primary" @click="mostrar"> Actualizar </v-btn>
        </template>
      </v-data-table>
    </v-main>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  data: () => ({
    url: "http://localhost/aguitabackend/crud.php",
    search: "",
    cargando: true,
    dialog: false,
    dialogDelete: false,
    headers: [
      { text: "ID", value: "id" },
      { text: "Nombre", value: "nombre" },
      { text: "Descripcion", value: "descripcion" },
      { text: "Imagen", value: "imagen" },
      { text: "Precio", value: "precio" },
      { text: "Stock", value: "stock" },
      { text: "Descuento", value: "descuento" },
      { text: "Estado", value: "estado" },
      { text: "Acciones", value: "actions", sortable: false },
    ],
    productos: [],
    editedIndex: -1,
    editedItem: {
      id: 0,
      nombre: "",
      descripcion: "",
      imagen: "",
      precio: "",
      stock: "",
      estado: 0,
      descuento: 0,
    },
    defaultItem: {
      id: 0,
      nombre: "",
      decripcion: "",
      imagen:
        "https://www.eoi.es/blogs/juanadoricelcepeda/files/2012/01/im1.jpg",
      precio: 0,
      stock: 0,
      estado: 1,
      descuento: 0,
    },
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Agregar" : "Editar";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.mostrar();
  },

  methods: {
    mostrar() {
      axios.post(this.url, { opcion: 1 }).then((response) => {
        this.productos = response.data;
        this.cargando = false;
      });
    },
    editItem(item) {
      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },
    deleteItem(item) {
      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },
    deleteItemConfirm() {
      if (this.editedItem.estado == 1) {
        axios
          .post(this.url, { opcion: 4, id: this.editedItem.id })
          .then((response) => {
            this.mostrar();
          })
          .catch((error) => {
            return error;
          });
      } else {
        axios
          .post(this.url, { opcion: 5, id: this.editedItem.id })
          .then((response) => {
            this.mostrar();
          })
          .catch((error) => {
            return error;
          });
      }
      this.closeDelete();
    },
    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },
    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },
    editar() {
      if (this.editedIndex > -1) {
        axios
          .post(this.url, {
            opcion: 3,
            id: this.editedItem.id,
            descripcion: this.editedItem.descripcion,
            nombre: this.editedItem.nombre,
            imagen: this.editedItem.imagen,
            precio: this.editedItem.precio,
            descuento: this.editedItem.descuento,
            estado: this.editedItem.estado,
            stock: this.editedItem.stock,
          })
          .then((response) => {
            this.mostrar();
          });
      } else {
        axios
          .post(this.url, {
            opcion: 2,
            estado: 1,
            descripcion: this.editedItem.descripcion,
            nombre: this.editedItem.nombre,
            imagen: this.editedItem.imagen,
            precio: this.editedItem.precio,
            descuento: this.editedItem.descuento,
            stock: this.editedItem.stock,
          })
          .then((response) => {
            this.mostrar();
          });
      }
      this.close();
    },
  },
};
</script>

<style>
</style>