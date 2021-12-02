<nav class="navbar navbar-expand-lg" id="my-navbar">
    <div class="container">
        <a class="navbar-brand font-weight-bold brand-color" href="../index.jsp?userId=${admin.id}">Boarding House UTE</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" 
                data-target="#my-nav" aria-controls="my-nav" aria-expanded="false" 
                aria-label="Toggle navigation">
            <span > Menu</span>
        </button>

        <div class="collapse navbar-collapse" id="my-nav">
            <ul class="navbar-nav ml-auto ">
                <a href="home.jsp?userId=${admin.id}"><span class="nav-link">Hello ${admin.firstname}</span></a>
            </ul>
        </div>
    </div>
</nav>