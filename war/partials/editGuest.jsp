<div
    id="editGuestModal"
    class="modal hide fade"
    tabindex="-1"
    role="dialog"
    aria-labelledby="editGuestModalLabel"
    aria-hidden="true"
    ng-controller="GuestsCtrl">
    <form name="editGuestForm">
        <div class="modal-header">
            <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-hidden="true">&times;</button>
            <h3 id="myModalLabel">Edit {{editGuest.firstName}} {{editGuest.lastName}}</h3>
        </div>
        <div class="modal-body">
            <h5>Guest Information</h5>
            <div class="input-prepend">
                <label
                    for="firstName"
                    class="add-on em5">First Name</label>
                <input
                    type="text"
                    class="input-medium"
                    name="firstName"
                    ng-model="editGuest.firstName" />
            </div>
            <div class="input-prepend">
                <label
                    for="lastName"
                    class="add-on em5">Last Name</label>
                <input
                    type="text"
                    class="input-medium"
                    name="lastName"
                    ng-model="editGuest.lastName" />
            </div>
            <div class="input-prepend">
                <label
                    for="address"
                    class="add-on em5">Address</label>
                <input
                    type="text"
                    class="input-medium"
                    name="address"
                    ng-model="editGuest.address" />
            </div>
            <div class="input-prepend">
                <label
                    for="editGuestZipCode"
                    class="add-on em5">Zip Code</label>
                <select
                    class="px150"
                    id="editGuestZipCode"
                    name="editGuestZipCode"
                    ng-model="editGuest.zipCode"
                    ng-options="z.zipCode as (z.city + ', ' + z.state + ' ' + z.zipCode) for z in zipCodes">
                </select>
            </div>
            <div class="input-prepend">
                <label
                    for="phone"
                    class="add-on em5">Phone #</label>
                <input
                    type="text"
                    class="input-medium"
                    name="phone"
                    ng-model="editGuest.phone" />
            </div>
            <h5>Family Information</h5>
            <div>
                <div class="input-prepend">
                    <label
                        for="adults"
                        class="add-on"
                        style="width: 5em;">Adults 18+</label>
                    <input
                        type="number"
                        integer
                        min="0"
                        max="20"
                        name="adults"
                        ng-model="editGuest.adults"
                        class="input-mini" />
                </div>
                <div class="input-prepend">
                    <label
                        for="seniors"
                        class="add-on"
                        style="width: 5em;">Seniors 65+</label>
                    <input
                        type="number"
                        integer
                        min="0"
                        max="20"
                        name="seniors"
                        ng-model="editGuest.seniors"
                        class="input-mini" />
                </div>
                <div class="input-prepend">
                    <label
                        for="children"
                        class="add-on"
                        style="width: 5em;">Children 0+</label>
                    <input
                        type="number"
                        integer
                        min="0"
                        max="20"
                        name="children"
                        ng-model="editGuest.children"
                        ng-changed="guestFormChanged()"
                        class="input-mini" />
                </div>
            </div>
            <h5>Ethnicity</h5>
            <div class="btn-group">
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.ethnicity"
                    btn-radio="'A'">Asian</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.ethnicity"
                    btn-radio="'B'">Black</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.ethnicity"
                    btn-radio="'L'">Latino</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.ethnicity"
                    btn-radio="'W'">White</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.ethnicity"
                    btn-radio="'O'">Other</button>
            </div>
            <h5>Preferred Language</h5>
            <div class="btn-group">
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.lang"
                    btn-radio="'E'">English</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.lang"
                    btn-radio="'C'">Chinese</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.lang"
                    btn-radio="'S'">Spanish</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="editGuest.lang"
                    btn-radio="'O'">Other</button>
            </div>
        </div>
        <div class="modal-footer">
            <button
                class="btn btn-primary"
                ng-click="saveEditGuest()">
                Save <i class="icon-chevron-right icon-white"></i>
            </button>
        </div>
    </form>
</div>