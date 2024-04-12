<template>
    <h1>Hi</h1>
    <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link" href="add">Add A Beer</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="delete">Delete A Beer</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" aria-current="update">Update Your Brewery</a>
    </li>
  </ul>

  <div class="container text-center">
  <div class="row">
    <div class="col">
      <div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">Example label</label>
  <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input placeholder">
</div>
<div class="mb-3">
  <label for="formGroupExampleInput2" class="form-label">Another label</label>
  <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input placeholder">
</div>
    </div>
    <div class="col">
      Column
    </div>
  </div>
</div>
  
  
  </template>
  
  <script>
  import BreweryService from '../services/BreweryService';

</script>