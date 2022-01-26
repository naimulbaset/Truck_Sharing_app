<template>
  <q-page>
    <div>
      <q-banner
        dense
        class="text-white"
        style="
          width: 100%;

          height: 70px;
          background-color: #7ed6df;
        "
      >
        <div class="row">
          <!-- <div class="q-pa-sm">
            <q-btn
              style="
                margin-top: 10px;
                font-size: 10px;
                height: 35px;
                margin-bottom: 10px;
              "
              icon="fas fa-redo-alt"
              v-on:click="resetFunction"
              color="blue-5"
            />
          </div> -->

          <!-- <div class="q-pa-sm">
            <q-btn
              label="save"
              style="
                margin-top: 10px;
                font-size: 10px;
                height: 35px;
                margin-bottom: 10px;
              "
              icon="far fa-check-circle"
              color="green"
            />
          </div> -->

          <div class="col q-pa-sm">
            <div style="text-align: right">
              <b
                style="
                  font-size: 25px;

                  color: white;
                "
                >Dashboard</b
              >
            </div>
          </div>
        </div>
      </q-banner>
    </div>

    <!-- <h6 style="text-align: center; margin-top:0px;  margin-bottom:20px; color:#B53471">Project Console Report</h6> -->
    <div class="row" id="row1">
      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
        <div id="chart2">
          <!-- chart goes here -->
        </div>
      </div>
      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
        <div id="chart1">
          <!-- chart goes here -->
        </div>
      </div>
      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
        <div id="chart">
          <!-- chart goes here -->
        </div>
      </div>
      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
        <div id="chart3">
          <!-- chart goes here -->
        </div>
      </div>
    </div>
  </q-page>
</template>

<script>
import { apiService } from "../common/api.service.js";
import * as d3 from "d3";

export default {
  data() {
    return {
      link: "/",
      user_profile_data: [],
      val: false,

      text: "",
      model: 0,
      active: true,
      active1: false,
      active2: false,
      options: ["5", "10", "15", "20", "25", "30"],
      model2: "",
      options2: [
        "Last 1 hour",
        "Last 1 day",
        "Last 1 week",
        "Last 1 month",
        "Last 3 month",
        "Last 12 month",
      ],

      date: "Select Date",
      dateOne: "23/07/2020",
    };
  },

  name: "dashboard",
  methods: {
    resetFunction() {
      d3.select("#chart").selectAll("*").remove();
    },

    noData() {
      console.log("no data call");
      d3.select("#chart").selectAll("*").remove();
      d3.select("#myTable").selectAll("*").remove();
      var margin = { top: 100, right: 20, bottom: 120, left: 80 },
        width = 800 - margin.left - margin.right,
        height = 400 - margin.top - margin.bottom;

      var svg = d3
        .select("#chart")
        .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
      svg
        .append("text")
        .attr("transform", "translate(0," + height + ")")
        .style("font-size", 35)
        .style("fill", "#E75480")
        .text("Out Of Range Or No Data Found");
    },

    // async draw() {
    //   // Data
    //   var dataset = await d3.json(
    //     "https://mocki.io/v1/5669d360-2793-4090-a4f2-d6b5233286fa"
    //   );
    //   dataset.sort(function (a, b) {
    //     return +b.count - +a.count;
    //   });
    //   dataset = dataset.slice(0, 5);
    //   // Dimensions
    //   let dimensions = {
    //     width: 450,
    //     height: 450,
    //     margins: 30,
    //   };

    //   dimensions.ctrWidth = dimensions.width - dimensions.margins * 2;
    //   dimensions.ctrHeight = dimensions.height - dimensions.margins * 2;

    //   // const radius = dimensions.ctrWidth / 2
    //   var radius = 100;

    //   var svg = d3
    //     .select("#chart")
    //     .append("svg")
    //     .attr("width", dimensions.width)
    //     .attr("height", dimensions.height);

    //   var ctr = svg
    //     .append("g") // <g>
    //     .attr(
    //       "transform",
    //       `translate(${dimensions.margins}, ${dimensions.margins})`
    //     );

    //   var populationPie = d3
    //     .pie()
    //     .value((d) => d.count)
    //     .sort(null);
    //   var slices = populationPie(dataset);

    //   var arc = d3
    //     .arc()
    //     .outerRadius(radius)
    //     .innerRadius(radius - 20);
    //   var arcLabels = d3.arc().outerRadius(180).innerRadius(120);

    //   var colors = d3.quantize(d3.interpolateSpectral, dataset.length);
    //   var colorScale = d3
    //     .scaleOrdinal()
    //     .domain(dataset.map((element) => element.ip))
    //     .range(colors);

    //   var arcGroup = ctr
    //     .append("g")
    //     .attr(
    //       "transform",
    //       `translate(${dimensions.ctrHeight / 2}, ${dimensions.ctrWidth / 2})`
    //     );

    //   arcGroup
    //     .selectAll("path")
    //     .data(slices)
    //     .join("path")
    //     .attr("d", arc)
    //     .attr("fill", (d) => colorScale(d.data.ip));

    //   var labelsGroup = ctr
    //     .append("g")
    //     .attr(
    //       "transform",
    //       `translate(${dimensions.ctrHeight / 2}, ${dimensions.ctrWidth / 2})`
    //     )
    //     .classed("labels", true);

    //   labelsGroup
    //     .selectAll("text")
    //     .data(slices)
    //     .join("text")
    //     .attr("transform", (d) => `translate(${arcLabels.centroid(d)})`)
    //     .call((text) =>
    //       text
    //         .append("tspan")
    //         .style("font-weight", "bold")
    //         .attr("y", -4)
    //         .text((d) => d.data.ip)
    //     )
    //     .call((text) =>
    //       text
    //         .filter((d) => d.endAngle - d.startAngle > 0.25)
    //         .append("tspan")
    //         .attr("y", 9)
    //         .attr("x", 0)
    //         .text((d) => d.data.count)
    //     );

    //   svg
    //     .append("text")
    //     .attr("y", 380)
    //     .attr("x", 220)
    //     .attr("dy", "1em")
    //     .style("text-anchor", "middle")
    //     .style("font-size", 25)
    //     .style("fill", "#E75480")
    //     .text("Destination IP by Count");
    // },

    async draw1() {
      // Data
      var dataset = await d3.json(
        "https://mocki.io/v1/82c84480-e8c0-44a6-af82-ab1c84d16322"
      );
      dataset = dataset.slice(0, 5);
      // Dimensions
      let dimensions = {
        width: 450,
        height: 450,
        margins: 30,
      };

      dimensions.ctrWidth = dimensions.width - dimensions.margins * 2;
      dimensions.ctrHeight = dimensions.height - dimensions.margins * 2;

      // const radius = dimensions.ctrWidth / 2
      var radius = 100;

      var svg = d3
        .select("#chart")
        .append("svg")
        .attr("width", dimensions.width)
        .attr("height", dimensions.height);

      var ctr = svg
        .append("g") // <g>
        .attr(
          "transform",
          `translate(${dimensions.margins}, ${dimensions.margins})`
        );

      var populationPie = d3
        .pie()
        .value((d) => d.count)
        .sort(null);
      var slices = populationPie(dataset);

      var arc = d3
        .arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 30);
      var arcLabels = d3
        .arc()
        .outerRadius(radius + 200)
        .innerRadius(50);

      var colors = d3.quantize(d3.interpolateSpectral, dataset.length);
      var colorScale = d3
        .scaleOrdinal()
        .domain(dataset.map((element) => element.ip))
        .range(colors);

      var arcGroup = ctr
        .append("g")
        .attr(
          "transform",
          `translate(${dimensions.ctrHeight / 2}, ${dimensions.ctrWidth / 2})`
        );

      arcGroup
        .selectAll("path")
        .data(slices)
        .join("path")
        .attr("d", arc)
        .attr("fill", (d) => colorScale(d.data.ip));

      var labelsGroup = ctr
        .append("g")
        .attr(
          "transform",
          `translate(${dimensions.ctrHeight / 2}, ${dimensions.ctrWidth / 2})`
        )
        .classed("labels", true);

      labelsGroup
        .selectAll("text")
        .data(slices)
        .join("text")
        .attr("transform", (d) => `translate(${arcLabels.centroid(d)})`)
        .call((text) =>
          text
            .append("tspan")
            .style("font-weight", "bold")
            .attr("y", -4)
            .text((d) => d.data.ip)
        )
        .call((text) =>
          text
            .filter((d) => d.endAngle - d.startAngle > 0.25)
            .append("tspan")
            .attr("y", 9)
            .attr("x", 0)
            .text((d) => d.data.count)
        );

      svg
        .append("text")
        .attr("y", 380)
        .attr("x", 220)
        .attr("dy", "1em")
        .style("text-anchor", "middle")
        .style("font-size", 20)
        .style("fill", "#E75480")
        .text("User IP by Count");
    },

    async httpsAndHttpRatio() {
      d3.select("#chart1").selectAll("*").remove();
      var data = await d3.csv("httpsAndHttpRatio.txt");

      data.forEach(function (d) {
        d.count = +d.count;
      });

      var type1 = data[1].type;
      var type2 = data[1].type;

      var value1 = (data[0].count / (data[1].count + data[0].count)) * 100;
      var value2 = (data[1].count / (data[1].count + data[0].count)) * 100;
      value1 = Math.round(value1 * 100) / 100;
      value2 = Math.round(value2 * 100) / 100;

      data = { HTTP: value1, HTTPS: value2 };

      var margin = { top: 40, right: 20, bottom: 120, left: 80 },
        width = 500 - margin.left - margin.right,
        height = 600 - margin.top - margin.bottom;

      // The radius of the pieplot is half the width or half the height (smallest one). I subtract a bit of margin.
      var radius = Math.min(width, height) / 2 - 40;

      // append the svg object to the div called 'my_dataviz'
      var svg = d3
        .select("#chart1")
        .append("svg")
        .attr("width", width)
        .attr("height", height)
        .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

      // set the color scale
      var color = d3.scaleOrdinal().domain(data).range(d3.schemeSet2);

      // Compute the position of each group on the pie:
      var pie = d3.pie().value(function (d) {
        return d.value;
      });
      var data_ready = pie(d3.entries(data));
      // Now I know that group A goes from 0 degrees to x degrees and so on.

      // shape helper to build arcs:
      var arcGenerator = d3.arc().innerRadius(0).outerRadius(radius);
      svg
        .append("text")
        .attr("y", 170)
        .attr("x", 30)
        .attr("dy", "1em")
        .style("text-anchor", "middle")
        .style("font-size", 20)
        .style("fill", "#E75480")
        .text("HTTP/HTTPS RATIO");
      // Build the pie chart: Basically, each part of the pie is a path that we build using the arc function.
      svg
        .selectAll("mySlices")
        .data(data_ready)
        .enter()
        .append("path")
        .attr("d", arcGenerator)
        .attr("fill", function (d) {
          return color(d.data.key);
        })
        .attr("stroke", "black")
        .style("stroke-width", "2px")
        .style("opacity", 0.7);

      // Now add the annotation. Use the centroid method to get the best coordinates
      svg
        .selectAll("mySlices")
        .data(data_ready)
        .enter()
        .append("text")
        .text(function (d) {
          return d.data.key + "  " + d.data.value + " %";
        })
        .attr("transform", function (d) {
          return "translate(" + arcGenerator.centroid(d) + ")";
        })
        .style("text-anchor", "middle")
        .style("font-size", 17);
    },

    async appBySession() {
      var numberOfData = 5;
      var selectedDateRange = 31560000;

      var timeStamp = Date.now();
      timeStamp = timeStamp / 1000;
      timeStamp = timeStamp - selectedDateRange;
      const parseDate = d3.timeParse("%m/%d/%Y");

      d3.select("#chart2").selectAll("*").remove();

      var margin = { top: 100, right: 120, bottom: 120, left: 80 },
        width = 500 - margin.left - margin.right,
        height = 400 - margin.top - margin.bottom;

      var x = d3.scaleBand().range([0, width]).padding(0.1);
      var y = d3.scaleLinear().range([height, 0]);

      // append the svg object to the body of the page
      // append a 'group' element to 'svg'
      // moves the 'group' element to the top left margin
      var svg = d3
        .select("#chart2")
        .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

      const ctr = svg.append("g");
      const tooltip = ctr.append("rect");
      const tooltipTextX = ctr.append("text");
      const tooltipTextY = ctr.append("text");

      // get the data
      d3.json("https://mocki.io/v1/ef3a250d-0b29-43b0-87cd-bb014307cb87").then(
        function (data) {
          function csvFilter() {
            data = data.filter(function (row) {
              if (parseDate(row["date"]).getTime() / 1000 > timeStamp) {
                return row["date"];
              }
            });
          }
          csvFilter();

          if (data.length < 1) {
            myobj.style.display = "none";
            svg
              .append("text")
              .attr("transform", "translate(0," + 0 + ")")
              .attr("transform", "translate(" + 180 + ",0" + ")")
              .style("font-size", 35)
              .style("fill", "#E75480")
              .text("Out Of Range Or No Data Found");
          } else {
            data = data.sort((a, b) => b.count - a.count);
            data = data.slice(0, numberOfData);

            // Scale the range of the data in the domains
            x.domain(
              data.map(function (d) {
                return d.app;
              })
            );
            y.domain([
              0,
              d3.max(data, function (d) {
                return d.count * 1.1;
              }),
            ]);

            // append the rectangles for the bar chart
            svg
              .selectAll(".bar")
              .data(data)
              .enter()
              .append("rect")
              .attr("fill", "steelblue")
              .attr("x", function (d) {
                return x(d.app);
              })
              .attr("width", x.bandwidth())
              .attr("y", function (d) {
                return y(d.count);
              })
              .attr("height", function (d) {
                return height - y(d.count);
              })
              .on("mouseover", function (d1, i1) {
                d3.select(this).style("fill", "#FF7376");

                tooltip
                  .style("display", "block")
                  .attr("style", "outline: thin solid pink;")
                  .attr("position", "relative")
                  .attr("width", 250)
                  .attr("height", 35)
                  .style("fill", "white")
                  .attr("y", y(d1.count) - 40 + "px")
                  .attr("x", function () {
                    return x(d1.app) + 2;
                  });

                tooltipTextX
                  .style("fill", "black")
                  .attr("y", y(d1.count) - 25 + "px")

                  .attr("x", x(d1.app) + 3)
                  .text(`App: ${d1.app}`);

                tooltipTextY
                  .style("fill", "black")
                  .attr("y", y(d1.count) - 10 + "px")
                  .attr("x", x(d1.app) + 3)
                  .text(`Count: ${d1.count}`);
              })
              .on("mouseout", function (d) {
                if (tooltip) tooltip.style("display", "none");
                if (tooltipTextX) tooltipTextX.style("fill", "none");
                if (tooltipTextY) tooltipTextY.style("fill", "none");
                d3.select(this).style("fill", "steelblue");
              });

            // add the x Axis
            svg
              .append("g")
              .attr("transform", "translate(0," + height + ")")
              .call(d3.axisBottom(x))
              .selectAll("text")
              .attr("transform", "translate(-10,0)rotate(-45)")
              .style("text-anchor", "end");

            // add the y Axis
            var f = d3.format(".2s");
            svg.append("g").call(
              d3
                .axisLeft(y)
                .ticks(5)
                .tickFormat((d) => `${f(d)}`)
            );
            svg
              .append("text")
              .attr("x", width / 2)
              .attr("y", 0 - margin.top / 2)
              .attr("text-anchor", "middle")
              .attr("font-weight", 700)
              .style("font-size", "18px")
              .style("fill", "darkBlue")
              .style("text-decoration", "underline")
              .text("Top App by session");
            // text label for the y axis
            svg
              .append("text")
              .attr("transform", "rotate(-90)")
              .attr("y", 0 - margin.left)
              .attr("x", 0 - height / 2)
              .attr("dy", "1em")
              .style("text-anchor", "middle")
              .style("font-size", 20)
              .style("fill", "#E75480")
              .text("Session Count");
          }
        }
      );
    },

    async appBySessionLineChart() {
      d3.select("#chart3").selectAll("*").remove();
      var selectedDateRange = 31560000;

      var timeStamp = Date.now();
      timeStamp = timeStamp / 1000;
      timeStamp = timeStamp - selectedDateRange;

      // Data
      var dataset = await d3.json(
        "https://mocki.io/v1/c84307c1-5b08-4e8c-87a4-e94fa89ac3ab"
      );
      const subgroups = Object.keys(dataset[0]).slice(2);

      const parseDate = d3.timeParse("%Y-%m-%dT%H:%M:%S");
      const xAccessor = (d) => d.dateTime;
      const yAccessorNone = (d) => parseInt(d.None);
      const yAccessorElevated = (d) => parseInt(d.Elevated);
      const yAccessorMedium = (d) => parseInt(d.Medium);
      const yAccessorHigh = (d) => parseInt(d.High);
      const yAccessorLow = (d) => parseInt(d.Low);
      var maxValue = 0;

      function csvFilter() {
        dataset = dataset.filter(function (row) {
          if (
            parseDate(row["date"] + "T" + row["time"]).getTime() / 1000 >
            timeStamp
          ) {
            return row["date"];
          }
        });
      }

      csvFilter();
      if (dataset.length < 1) {
        myobj.style.display = "none";
        d3.select("#chart3").selectAll("*").remove();
        // d3.select("#myTable").selectAll("*").remove();
        var margin = { top: 100, right: 20, bottom: 120, left: 300 },
          width = 400 - margin.left - margin.right,
          height = 200 - margin.top - margin.bottom;

        var svg = d3
          .select("#chart3")
          .append("svg")
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom)
          .append("g")
          .attr(
            "transform",
            "translate(" + margin.left + "," + margin.top + ")"
          );
        svg
          .append("text")
          .attr("transform", "translate(0," + height + ")")
          .style("font-size", 20)
          .style("fill", "#E75480")
          .text("Out Of Range Or No Data Found");
      } else {
        dataset.forEach(function (d) {
          d.Elevated = +d.Elevated;
          d.None = +d.None / 10;
          d.dateTime = parseDate(d.date + "T" + d.time);
          if (maxValue < +d.None) {
            maxValue = +d.None;
          }
          if (maxValue < +d.Elevated) {
            maxValue = +d.Elevated;
          }
          if (maxValue < +d.Medium) {
            maxValue = +d.Medium;
          }
          if (maxValue < +d.Low) {
            maxValue = +d.Low;
          }
          if (maxValue < +d.High) {
            maxValue = +d.High;
          }
        });

        function sortByDateAscending(a, b) {
          // Dates will be cast to numbers automagically:
          return a.dateTime - b.dateTime;
        }

        dataset = dataset.sort(sortByDateAscending);
        // Dimensions
        let dimensions = {
          width: 500,
          height: 250,
          margins: 50,
        };

        dimensions.ctrWidth = dimensions.width - dimensions.margins * 2;
        dimensions.ctrHeight = dimensions.height - dimensions.margins * 2;

        // Draw Image
        const svg = d3
          .select("#chart3")
          .append("svg")
          .attr("width", dimensions.width)
          .attr("height", dimensions.height);

        const ctr = svg
          .append("g") // <g>
          .attr(
            "transform",
            `translate(${dimensions.margins}, ${dimensions.margins})`
          );

        // Scales
        const yScale = d3
          .scaleLinear()
          .domain([0, maxValue * 1.1])
          .range([dimensions.ctrHeight, 0])
          .nice();

        const xScale = d3
          .scaleTime()
          .domain(d3.extent(dataset, xAccessor))
          .range([0, dimensions.ctrWidth]);

        // console.log(xScale(xAccessor(dataset[0])), dataset[0])

        const lineGeneratorNone = d3
          .line()
          .defined(function (d) {
            return d.None != null;
          })
          .x((d) => xScale(xAccessor(d)))
          .y((d) => yScale(yAccessorNone(d)))
          .curve(d3.curveBasis);

        const lineGeneratorElevated = d3
          .line()
          .defined(function (d) {
            return d.Elevated != null;
          })
          .x((d) => xScale(xAccessor(d)))
          .y((d) => yScale(yAccessorElevated(d)))
          .curve(d3.curveBasis);

        const lineGeneratorHigh = d3
          .line()
          .defined(function (d) {
            return d.Elevated != null;
          })
          .x((d) => xScale(xAccessor(d)))
          .y((d) => yScale(yAccessorHigh(d)))
          .curve(d3.curveBasis);

        const lineGeneratorLow = d3
          .line()
          .defined(function (d) {
            return d.Elevated != null;
          })
          .x((d) => xScale(xAccessor(d)))
          .y((d) => yScale(yAccessorLow(d)))
          .curve(d3.curveBasis);

        const lineGeneratorMedium = d3
          .line()
          .defined(function (d) {
            return d.Elevated != null;
          })
          .x((d) => xScale(xAccessor(d)))
          .y((d) => yScale(yAccessorMedium(d)))
          .curve(d3.curveBasis);

        svg
          .append("text")
          .attr("y", 220)
          .attr("x", 200)
          .attr("dy", "1em")
          .style("text-anchor", "middle")
          .style("font-size", 20)
          .style("fill", "#E75480")
          .text("Top App Risk");

        // console.log(lineGenerator(dataset))

        ctr
          .append("path")
          .datum(dataset)
          .attr("d", lineGeneratorNone)
          .attr("fill", "none")
          .attr("stroke", "#4287f5")
          .attr("stroke-width", 2);

        ctr
          .append("path")
          .datum(dataset)
          .attr("d", lineGeneratorElevated)
          .attr("fill", "none")
          .attr("stroke", "#5e3047")
          .attr("stroke-width", 2);

        ctr
          .append("path")
          .datum(dataset)
          .attr("d", lineGeneratorHigh)
          .attr("fill", "none")
          .attr("stroke", "#f71616")
          .attr("stroke-width", 2);

        ctr
          .append("path")
          .datum(dataset)
          .attr("d", lineGeneratorLow)
          .attr("fill", "none")
          .attr("stroke", "#4eaa47")
          .attr("stroke-width", 2);

        ctr
          .append("path")
          .datum(dataset)
          .attr("d", lineGeneratorMedium)
          .attr("fill", "none")
          .attr("stroke", "#8B8000")
          .attr("stroke-width", 2);

        // Axis
        const f = d3.format(".1s");
        const yAxis = d3
          .axisLeft(yScale)
          .ticks(3)
          .tickFormat((d) => `${f(d)} `);

        ctr.append("g").call(yAxis);

        const xAxis = d3
          .axisBottom(xScale)
          .ticks(5)
          .tickFormat(d3.timeFormat("%b-%y"));

        ctr
          .append("g")
          .style("transform", `translateY(${dimensions.ctrHeight}px)`)
          .call(xAxis);

        //ToolTip

        const chart = d3
          .select("svg")
          .append("g")
          .attr(
            "transform",
            "translate(" + dimensions.margins + "," + dimensions.margins + ")"
          );

        const tooltip = ctr.append("rect");
        const tooltipLine = ctr.append("line");
        const tooltipTextHeader = ctr.append("text");
        const tooltipTextNone = ctr.append("text");
        const tooltipTextMedium = ctr.append("text");
        const tooltipTextElevated = ctr.append("text");
        const tooltipTextHigh = ctr.append("text");
        const tooltipTextLow = ctr.append("text");

        ctr
          .append("rect")
          .attr("width", dimensions.width)
          .attr("height", dimensions.height)
          .attr("opacity", 0)
          .on("mousemove", drawTooltip)
          .on("mouseout", removeTooltip);

        function removeTooltip() {
          if (tooltip) tooltip.style("display", "none");
          if (tooltipLine) tooltipLine.attr("stroke", "none");
          if (tooltipTextHeader) tooltipTextHeader.style("fill", "none");
          if (tooltipTextNone) tooltipTextNone.style("fill", "none");
          if (tooltipTextMedium) tooltipTextMedium.style("fill", "none");
          if (tooltipTextElevated) tooltipTextElevated.style("fill", "none");
          if (tooltipTextHigh) tooltipTextHigh.style("fill", "none");
          if (tooltipTextLow) tooltipTextLow.style("fill", "none");
        }

        function drawTooltip() {
          // const year = Math.floor((xScale.invert(d3.mouse(tipBox.node())[0]) + 5) / 10) * 10;
          // console.log( d3.mouse(this)[0] )
          const mousePos = d3.mouse(this);
          const date1 = xScale.invert(d3.mouse(this)[0]);
          // console.log(date1);
          const bisector = d3.bisector(xAccessor).left;
          const index = bisector(dataset, date1, 1);
          const stock = dataset[index - 1];

          // console.log(xScale(xAccessor(stock)))
          // console.log(bisector(dataset,date1,1))
          // console.log(d3.event.pageX)
          // console.log(yScale(yAccessorMedium(stock)))

          tooltipLine
            .attr("stroke", "black")
            .attr("x1", xScale(xAccessor(stock)))
            .attr("x2", xScale(xAccessor(stock)))
            .attr("y1", 0)
            .attr("y2", dimensions.height - dimensions.margins * 2 + 20);

          tooltip
            .style("display", "block")
            .attr("style", "outline: thin solid pink;")
            .attr("position", "relative")
            .attr("width", 225)
            .attr("height", 95)
            .style("fill", "white")
            .attr("y", 0 + "px")
            .attr("x", function (d) {
              if (xScale(xAccessor(stock)) <= dimensions.width / 2) {
                return xScale(xAccessor(stock)) + 10 + "px";
              } else {
                return xScale(xAccessor(stock)) - 235 + "px";
              }
            });

          tooltipTextHeader
            .style("fill", "black")
            .attr("y", 15 + "px")
            .attr("x", function (d) {
              if (xScale(xAccessor(stock)) <= dimensions.width / 2) {
                return xScale(xAccessor(stock)) + 15 + "px";
              } else {
                return xScale(xAccessor(stock)) - 230 + "px";
              }
            })
            .text(`Date: ${xAccessor(stock).toString().split("G")[0]}`);

          tooltipTextNone
            .style("fill", "#4287f5")
            .attr("y", 30 + "px")
            .attr("x", function (d) {
              if (xScale(xAccessor(stock)) <= dimensions.width / 2) {
                return xScale(xAccessor(stock)) + 15 + "px";
              } else {
                return xScale(xAccessor(stock)) - 230 + "px";
              }
            })
            .text(`None: ${yAccessorNone(stock)}`);

          tooltipTextMedium
            .style("fill", "#8B8000")
            .attr("y", 45 + "px")
            .attr("x", function (d) {
              if (xScale(xAccessor(stock)) <= dimensions.width / 2) {
                return xScale(xAccessor(stock)) + 15 + "px";
              } else {
                return xScale(xAccessor(stock)) - 230 + "px";
              }
            })
            .text(`Medium: ${yAccessorMedium(stock)}`);

          tooltipTextElevated
            .style("fill", "#5e3047")
            .attr("y", 60 + "px")
            .attr("x", function (d) {
              if (xScale(xAccessor(stock)) <= dimensions.width / 2) {
                return xScale(xAccessor(stock)) + 15 + "px";
              } else {
                return xScale(xAccessor(stock)) - 230 + "px";
              }
            })
            .text(`Elevated: ${yAccessorElevated(stock)}`);

          tooltipTextHigh
            .style("fill", "#f71616")
            .attr("y", 75 + "px")
            .attr("x", function (d) {
              if (xScale(xAccessor(stock)) <= dimensions.width / 2) {
                return xScale(xAccessor(stock)) + 15 + "px";
              } else {
                return xScale(xAccessor(stock)) - 230 + "px";
              }
            })
            .text(`High: ${yAccessorHigh(stock)}`);

          tooltipTextLow
            .style("fill", "#4eaa47")
            .attr("y", 90 + "px")
            .attr("x", function (d) {
              if (xScale(xAccessor(stock)) <= dimensions.width / 2) {
                return xScale(xAccessor(stock)) + 15 + "px";
              } else {
                return xScale(xAccessor(stock)) - 230 + "px";
              }
            })
            .text(`Low: ${yAccessorLow(stock)}`);
        }

        //Legends

        const color = d3
          .scaleOrdinal()
          .domain(subgroups)
          .range(["#4287f5", "#8B8000", "#5e3047", "#f71616", "#4eaa47"]);

        var legend = svg
          .append("g")
          .attr("transform", "translate(" + -dimensions.margins + ", 0)");

        legend
          .selectAll("rect")
          .data(subgroups)
          .enter()
          .append("rect")
          .attr("y", 0)
          .attr("x", function (d, i) {
            return i * 100 + 100;
          })
          .attr("width", 12)
          .attr("height", 12)
          .attr("fill", function (d, i) {
            return color(i + 1);
          });

        legend
          .selectAll("text")
          .data(subgroups)
          .enter()
          .append("text")
          .text(function (d) {
            return d;
          })
          .attr("y", 0)
          .attr("x", function (d, i) {
            return i * 100 + 115;
          })
          .attr("text-anchor", "start")
          .style("font-size", 15)
          .attr("alignment-baseline", "hanging");
      }
    },
  },
  async mounted() {
    this.httpsAndHttpRatio();
    // this.draw();
    this.draw1();
    this.appBySession();
    this.appBySessionLineChart();
  },
};
</script>
<style scoped>
#chart {
  margin: 10px auto;
  width: 100%;
  position: relative;
  vertical-align: center;
}
#chart1 {
  margin: 10px auto;
  width: 100%;
  position: relative;
  vertical-align: center;
}
#chart2 {
  margin: 10px auto;
  width: 100%;
  position: relative;
  vertical-align: center;
}
#chart3 {
  margin: 10px auto;
  width: 100%;
  position: relative;
  vertical-align: center;
}
#myDIV {
  margin: auto;
  display: flex;
  flex-direction: row;
  justify-content: center;
  padding: 50px;
}
.lds-hourglass {
  display: inline-block;
  position: relative;
  width: 80px;
  height: 80px;
}
.lds-hourglass:after {
  content: " ";
  display: block;
  border-radius: 50%;
  width: 0;
  height: 0;
  margin: 8px;
  box-sizing: border-box;
  border: 32px solid #fff;
  border-color: steelblue transparent steelblue transparent;
  animation: lds-hourglass 1.2s infinite;
}
@keyframes lds-hourglass {
  0% {
    transform: rotate(0);
    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
  }
  50% {
    transform: rotate(900deg);
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
  }
  100% {
    transform: rotate(1800deg);
  }
}

body {
  background-color: #c7ecee;
}

.red {
  border: 2px solid #510572;
  background-color: #8e44ad;
}
#row1 > div {
  padding: 10px 15px;
  background-color: #c7ecee;
  border: 1px solid rgba(86, 61, 124, 0.2);
}

#row1 + .row1 {
  margin-top: 1rem;
}
</style>
