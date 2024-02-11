import { BridgeComponent, BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
    static component = "sync"
    static targets = [ "sync", "indicator" ]

    syncTargetConnected(target) {
        const syncButton = new BridgeElement(target)
        const syncTitle = syncButton.title
        const syncX = syncButton.bridgeAttribute("x")
        const syncY = syncButton.bridgeAttribute("y")

        this.send("connect", { 'syncTitle': syncTitle, 'syncX': syncX , 'syncY': syncY }, () => {
            target.click()
        })
    }

    showIndicator() {
        this.indicatorTarget.classList.remove("hidden")
    }
}