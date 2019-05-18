package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

const (
	ENV_APP_PORT_KEY = "fish_APP_PORT"
	APP_NAME         = "fish"
	HEALTHY          = "healthy"
)

type Health struct {
	App    string `json:"app"`
	Status string `json:"status"`
}

type Color struct {
	Name string `json:"name,omitempty"`
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func GetHealth(w http.ResponseWriter, r *http.Request) {
	status := Health{App: APP_NAME, Status: HEALTHY}
	json.NewEncoder(w).Encode(status)
}

func GetColor(w http.ResponseWriter, r *http.Request) {
	version, err := ioutil.ReadFile("version")
	check(err)
	color := Color{Name: string(version)}
	json.NewEncoder(w).Encode(color)
}

func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Welcome!\n")
}

func main() {
	// port := fmt.Sprintf(":%s", os.Getenv(ENV_APP_PORT_KEY))
	//port := "8080"
	router := mux.NewRouter()
	router.HandleFunc("/health", GetHealth).Methods("GET")
	router.HandleFunc("/fish", GetColor).Methods("GET")
	router.HandleFunc("/", Index)
	fmt.Println("Running server!")
	fmt.Println("http://127.0.0.1:8080/fish")
	log.Fatal(http.ListenAndServe(":8080", router))
}
