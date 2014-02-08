<div
    id="newGuestModal"
    class="modal hide fade"
    tabindex="-1"
    role="dialog"
    aria-labelledby="newGuestModalLabel"
    aria-hidden="true"
    ng-controller="GuestsCtrl">
    <form name="newGuestForm">
        <div class="modal-header">
            <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-hidden="true">&times;</button>
            <h3 id="myModalLabel">New Guest</h3>
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
                    ng-model="newGuest.firstName"
                    required />
            </div>
            <div class="input-prepend">
                <label
                    for="lastName"
                    class="add-on em5">Last Name</label>
                <input
                    type="text"
                    class="input-medium"
                    name="lastName"
                    ng-model="newGuest.lastName"
                    required />
            </div>
            <div class="input-prepend">
                <label
                    for="address"
                    class="add-on em5">Address</label>
                <input
                    type="text"
                    class="input-medium"
                    name="address"
                    ng-model="newGuest.address"
                    required />
            </div>
            <div class="input-prepend">
                <label
                    for="zipCode"
                    class="add-on em5">Zip Code</label>
                <select
                    class="px150"
                    id="newGuestZipCode"
                    name="newGuestZipCode"
                    ng-model="newGuest.zipCode"
                    ng-options="z.zipCode as (z.city + ', ' + z.state + ' ' + z.zipCode) for z in zipCodes"
                    required>
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
                    ng-model="newGuest.phone"
                    ng-pattern="/^\d{3}-\d{3}-\d{4}$/"
                    placeholder="ex: 123-555-1234"
                    required />
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
                        ng-model="newGuest.adults"
                        class="input-mini"
                        required />
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
                        ng-model="newGuest.seniors"
                        class="input-mini"
                        required />
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
                        ng-model="newGuest.children"
                        ng-changed="guestFormChanged()"
                        class="input-mini"
                        required />
                </div>
            </div>
            <h5>Ethnicity</h5>
            <div class="btn-group">
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.ethnicity"
                    btn-radio="'A'">Asian</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.ethnicity"
                    btn-radio="'B'">Black</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.ethnicity"
                    btn-radio="'L'">Latino</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.ethnicity"
                    btn-radio="'W'">White</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.ethnicity"
                    btn-radio="'O'">Other</button>
            </div>
            <h5>Preferred Language</h5>
            <div class="btn-group">
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.lang"
                    btn-radio="'E'">English</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.lang"
                    btn-radio="'C'">Chinese</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.lang"
                    btn-radio="'S'">Spanish</button>
                <button
                    type="button"
                    class="btn"
                    ng-model="newGuest.lang"
                    btn-radio="'O'">Other</button>
            </div>
        </div>
        <div class="modal-footer">
            <button
                class="btn btn-primary"
                ng-disabled="newGuestForm.$invalid||(!newGuest.ethnicity)||(!newGuest.lang)||(newGuest.adults==0&&newGuest.seniors==0)"
                ng-click="saveNewGuest()">
                Save <i class="icon-chevron-right icon-white"></i>
            </button>
        </div>
    </form>
</div>