<form>
    <fieldset>
        <legend>Personal Information</legend>
        <div class="row">
            <div class="span3 offset1">
                <label for="firstName">First Name</label>
                <input type="text" name="firstName" placeholder="First Name" required/>
            </div>
            <div class="span3">
                <label for="lastName">Last Name</label>
                <input type="text" name="lastName" placeholder="Last Name" required/>
            </div>
            <div class="span3">
                <label for="ethnicity">Ethnicity</label>
                <div class="btn-group" data-toggle="buttons-radio">
                    <button type="button" class="btn">Asian</button>
                    <button type="button" class="btn">Black</button>
                    <button type="button" class="btn">Latino</button>
                    <button type="button" class="btn">White</button>
                    <button type="button" class="btn">Other</button>
                </div>
            </div>
        </div>
        <legend>Address</legend>
        <div class="row">
            <div class="span3 offset1">
                <label for="address" class="control-label">Address</label>
                <input type="text" name="address" placeholder="Address" required/>
            </div>
            <div class="span6">
                <label for="zipCode" class="control-label">Zip Code</label>
                <select class="combobox" id="zipCode" name="zipCode" required>
                    <option value="">City, State Zip Code</option>
                </select>
            </div>
        </div>
        <legend>Total Family Members</legend>
        <div class="row">
            <div class="span3 offset1">
                <label for="adults" class="control-label">Adults</label>
                <input type="text" name="adults" placeholder="Adults" value="1" required/>
            </div>
            <div class="span3">
                <label for="Seniors" class="control-label">Seniors</label>
                <input type="text" name="seniors" placeholder="Seniors" value="0" required/>
            </div>
            <div class="span3">
                <label for="children" class="control-label">Children</label>
                <input type="text" name="children" placeholder="Children" value="0" required/>
            </div>
        </div>
    </fieldset>
    <div class="form-actions row">
        <div class="offset8">
            <button class="btn btn-large btn-primary" ng-click="postForm()">
                Submit <i class="icon-chevron-right icon-white"></i>
            </button>
        </div>
    </div>
</form>
