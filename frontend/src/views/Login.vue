<template>
  <v-main>
    <v-container>
      <v-form ref="form" v-model="valid" lazy-validation>
        <v-row class="pt-8">
          <v-col
            xs="12"
            offset-xs="0"
            sm="10"
            offset-sm="1"
            md="8"
            offset-md="2"
            lg="6"
            offset-lg="3"
            xl="4"
            offset-xl="4"
          >
            <v-card class="pa-4" elevation="2">
              <v-container>
                <v-row>
                  <v-col>
                    <v-text-field
                      v-model="username"
                      :rules="usernameRules"
                      label="Username"
                      required
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col>
                    <v-text-field
                      type="password"
                      v-model="password"
                      :rules="passwordRules"
                      label="Password"
                      required
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn
                  :disabled="!valid"
                  color="success"
                  text
                  class="mr-4"
                  @click="submit"
                >
                  Login
                </v-btn>
                <v-btn color="error" text class="mr-4" @click="reset">
                  Reset
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-form>
    </v-container>
  </v-main>
</template>

<script>
import Vue from "vue";

export default {
  data: () => ({
    valid: true,
    username: "admin",
    password: "123456",
    usernameRules: [(v) => !!v || "Username is required"],
    passwordRules: [(v) => !!v || "Password is required"],
  }),

  methods: {
    async submit() {
      if (this.$refs.form.validate()) {
        // submit to backend to authenticate
        let formData = new FormData();
        formData.append("username", this.username);
        formData.append("password", this.password);

        let response = await Vue.axios.post("/api/login", formData);

        if (response.data.success) {
          await this.$router.push({ path: "/" });
        }
      }
    },
    reset() {
      this.$refs.form.reset();
    },
  },
};
</script>
