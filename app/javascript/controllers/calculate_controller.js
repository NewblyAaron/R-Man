import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
    static targets = ["barangay", "bundle"]
    static values = {
        url: String,
        param: String
    }

    connect() {
        console.log("connected to controller")
    }

    hello() {
        console.log("Hello world!")
    }

    calc() {
        let params = new URLSearchParams()
        params.append("barangay", this.barangayTarget.selectedOptions[0].value)
        params.append("bundle", this.bundleTarget.selectedOptions[0].value)

        console.log(params)

        if (!params.get("barangay") || !params.get("bundle")) {
            alert("i don't know how but that's illegal my guy")
            return
        }

        console.log(`${this.urlValue}?${params}`)

        get(`${this.urlValue}?${params}`, {
            responseKind: "turbo-stream"
        })
    }
}