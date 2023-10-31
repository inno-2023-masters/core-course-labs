import {app} from "./app";

import promBundle from "express-prom-bundle";

// Add the options to the prometheus middleware most option are for http_request_duration_seconds histogram metric
const metricsMiddleware = promBundle({
    includeMethod: true,
    includePath: true,
    includeStatusCode: true,
    includeUp: true,
    customLabels: {project_name: 'joke_js', project_type: 'test_metrics_labels'},
    promClient: {
        collectDefaultMetrics: {}
    }
});
// add the prometheus middleware to all routes
app.use(metricsMiddleware)

app.listen(3000, () => {
    console.log('The application is listening on port 3000!');
})

process.on('SIGINT', function () {
    console.log("\nGracefully shutting down from SIGINT (Ctrl-C)");
    // some other closing procedures go here
    process.exit(0);
});