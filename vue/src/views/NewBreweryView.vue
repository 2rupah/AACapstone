<template>
    <h1>Add A New Brewery</h1>
    <!--think we've still gotta implement the functionality from the back end-->
    <form>
    <div class="brewery-form">
    <label for="brewery-name">Brewery Name: </label>
    <input type="text" id="name" name="brewery-name" placeholder='Enter Brewery Name'>
    </div>

    <div class="brewery-form">
    <label for="description">Brewery Description: </label>
    <textarea type="text" id="description" name="description" placeholder='Enter Brewery Description'></textarea>
    </div>

    <div class="brewery-form">
    <label for="year">Brewery Establishment Year: </label>
    <input type="text" id="year" name="year" placeholder='Enter Year Established'>
    </div>

    <div class="brewery-form">
    <label for="logo">Brewery Logo Url: </label>
    <input type="text" id="logo" name="logo" placeholder='Enter Image URL'>
    </div>
    <button type="submit" id="button">Add Brewery</button>
    </form>
    </template>

    <script>
    import BreweryService from '../services/BreweryService';
    </script>

<style>
h1, label {
    text-align: center;
}

.brewery-form {
    width: 50%;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
}

input, textarea {
    width: 100%;
    padding: 5px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

button {
    width: 50%;
    margin-top: 10px;
}
</style>