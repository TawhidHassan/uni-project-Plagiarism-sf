@extends('layouts.frontend.app')

@section('content')
<div class="container">

    <!-- Masthead-->
    <header class="masthead text-white text-center">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                
                <ul style="color: rgb(240, 204, 3); margin-left: 90px;font-size: 18px;font-weight: bolder;">
                    <li> Significant plagiarism found
                        Ensure your work is fresh and original by checking it against EUB thesis DataBase. </li><br>
                        @foreach($productsAll as $key=>$project)
                            <li>{{$project->project_name}}</li>
                        @endforeach
                </ul>
            </div>
        </div>
    </header>

    <!-- Footer-->
    <footer class="footer" style="margin-top:100px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 h-200 text-center text-lg-left my-auto">
                    <p class=" small mb-4 mb-lg-0" style="color:white;font-size: 20px;">© Sifat-Sakib-Mili 2021. All
                        Rights Reserved.</p>
                </div>

            </div>
        </div>
    </footer>

</div>
@endsection
