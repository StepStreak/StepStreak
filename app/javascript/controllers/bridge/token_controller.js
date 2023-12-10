import { BridgeComponent, BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
    static component = "token"
    static targets = [ "token" ]

    tokenTargetConnected(target) {
        const token = new BridgeElement(target)
        const syncToken = token.title
        this.send("connect", { syncToken })
    }
}