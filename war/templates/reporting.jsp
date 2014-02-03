<div class="container">
    <div class="input-prepend input-append">
        <label
            for="year"
            class="add-on">Year</label>
        <input
            type="text"
            name="year"
            ng-model="year" />
        <button
            class="btn btn-primary"
            ng-click="runReport()">
            Run <i class="icon-chevron-right icon-white"></i>
        </button>
    </div>
    <table class="table table-hover table-bordered">
        <caption><b>Annual Order History for {{reportYear}}</b></caption>
        <tr>
            <th>Month</th>
            <th>Total Orders</th>
            <th>Total Fed</th>
            <th>Children</th>
            <th>Adults</th>
            <th>Seniors</th>
        </tr>
        <tr ng-repeat="row in reportData">
            <td>{{row.monthName}}</td>
            <td>{{row.totalOrder}}</td>
            <td>{{row.totalFed}}</td>
            <td>{{row.children}}</td>
            <td>{{row.adults}}</td>
            <td>{{row.seniors}}</td>
        </tr>
        <tr>
            <th>Total</th>
            <th>{{total.totalOrder}}</th>
            <th>{{total.totalFed}}</th>
            <th>{{total.children}}</th>
            <th>{{total.adults}}</th>
            <th>{{total.seniors}}</th>
        </tr>
    </table>
</div>