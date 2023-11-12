import { BridgeComponent, BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
    static component = "sync"
    static targets = [ "sync" ]

    syncTargetConnected(target) {
        const syncButton = new BridgeElement(target)
        const syncTitle = syncButton.title
        this.send("connect", { syncTitle }, () => {
            target.click()
        })
    }
}