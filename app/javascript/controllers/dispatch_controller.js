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

        console.log(`/calc_dispatch?${params}`)

        get(`/calc_dispatch?${params}`, {
            responseKind: "turbo-stream"
        })
    }

    dispatchLoad() {
        let params = new URLSearchParams()
        params.append("barangay", this.barangayTarget.selectedOptions[0].value)
        params.append("bundle", this.bundleTarget.selectedOptions[0].value)

        console.log(params)

        if (!params.get("barangay") || !params.get("bundle")) {
            alert("i don't know how but that's illegal my guy")
            return
        }

        console.log(`/dispatch_load?${params}`)

        get(`/dispatch_load?${params}`, {
            responseKind: "turbo-stream"
        })
        // window.location.replace("/dispatch")
    }

    dispatchUnload() {
        let params = new URLSearchParams()
        params.append("barangay", this.barangayTarget.selectedOptions[0].value)
        params.append("bundle", this.bundleTarget.selectedOptions[0].value)

        console.log(params)

        if (!params.get("barangay") || !params.get("bundle")) {
            alert("i don't know how but that's illegal my guy")
            return
        }

        console.log(`/dispatch_unload?${params}`)

        get(`/dispatch_unload?${params}`, {
            responseKind: "turbo-stream"
        })
        // window.location.replace("/dispatch")
    }
}