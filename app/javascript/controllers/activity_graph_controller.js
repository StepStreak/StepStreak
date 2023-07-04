import { Controller } from "@hotwired/stimulus"
import ApexCharts from "apexcharts"

export default class extends Controller {
    static targets = ["graph"]
    static values = { url: String }

    async connect() {
        let data;
        await fetch('/'+this.urlValue+'.json')
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(json => data = json)
            .catch(e => console.error('There was a problem with the fetch operation: ' + e.message));

        const options = {
            colors: ['#1A56DB', '#FDBA8C'],
            series: [
                {
                    name: 'Quantity',
                    color: '#1A56DB',
                    data: data
                }
            ],
            chart: {
                type: 'bar',
                height: '140px',
                fontFamily: 'Inter, sans-serif',
                foreColor: '#4B5563',
                toolbar: {
                    show: false
                }
            },
            plotOptions: {
                bar: {
                    columnWidth: '90%',
                    borderRadius: 3
                }
            },
            tooltip: {
                shared : false,
                intersect: false,
                style: {
                    fontSize: '14px',
                    fontFamily: 'Inter, sans-serif'
                },
            },
            states: {
                hover: {
                    filter: {
                        type: 'darken',
                        value: 1
                    }
                }
            },
            stroke: {
                show: true,
                width: 5,
                colors: ['transparent']
            },
            grid: {
                show: false
            },
            dataLabels: {
                enabled: false
            },
            legend: {
                show: false
            },
            xaxis: {
                floating: false,
                labels: {
                    show: false
                },
                axisBorder: {
                    show: false
                },
                axisTicks: {
                    show: false
                },
            },
            yaxis: {
                show: false
            },
            fill: {
                opacity: 1
            }
        };

        const chart = new ApexCharts(this.graphTarget, options)
        chart.render()
    }
}
