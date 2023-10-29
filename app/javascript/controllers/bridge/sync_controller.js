import { BridgeComponent, BridgeElement } from "@hotwired/strada"
import { Turbo } from "@hotwired/turbo-rails"

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

    refresh() {
        Turbo.visit(window.location.href, { action: "replace" })
    }
}