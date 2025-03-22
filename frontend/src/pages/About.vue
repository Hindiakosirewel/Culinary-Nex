<template>
    <section class="about-section">
        <div class="heading">
            <span>about the app</span>
        </div>

        <div class="row">
            <div class="about-content">
                <img src="../assets/images/taco-chefcartoon.png" alt="">
                <div class="about-content-text">
                    <p>
                        CulinaryNex is a versatile solution designed to streamline and enhance the operations
                        of canteens and cafeterias. It simplifies customer transactions. This system is built
                        to empower canteen and cafeteria staffs to efficiently manage and process customer
                        orders.
                    </p>
                    <p>
                        The application is developed by QWERTY DEVS, a dynamic group of 3rd Year BSIT students
                        of Gordon College.
                    </p>
                    <hr />
                    <div class="developer-names">
                        <span>Lee Calleja Silvestre</span>
                        <span>Chris John Madriago</span>
                        <span>Joseph Linobo</span>
                        <span>Raymond Paul Vianzon</span>
                        <span>RJ Domalanta</span>
                        <span>Jamuel Dumangas</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="about-article">
                <h3>Executing Culinary on a Nex level.</h3>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: "About",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Satisfy&display=swap");

.about-section {
    padding: 2rem 9%;
}

.about-content-text .developer-names {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    padding-left: 120px;
}

.about-content-text .developer-names span {
    margin: 5px;
    flex-basis: 45%;
}

.about-section .about-content {
    display: flex;
    width: 100%;

}

.about-section .about-content img {
    background-color: rgb(249, 249, 249);
}

.about-section .about-content .about-content-text {
    font-size: 16px;
    padding-left: 50px;
}

.about-section .about-article {
    margin-top: 50px;
    padding: 10px;
    text-align: center;
    background-color: #27ae60;
    width: 100%;
}

.about-section .about-article h3 {
    font-family: 'Satisfy', cursive;
    font-size: 32px;
    color: white;
}


.about-section .gallery {
    overflow: hidden;
    padding: 100px;
}

.about-section .gallery .wrapper {
    position: relative;
    flex-grow: 1;
    margin: auto;
    max-width: 1200px;
    max-height: 1200px;
    display: grid;
    grid-template-columns: repeat(8, 1fr);
    grid-template-rows: repeat(4, 1fr);
    grid-gap: 2vmin;
    justify-items: center;
    align-items: center;
}

.about-section .gallery .wrapper img {
    z-index: 1;
    grid-column: span 2;
    max-width: 100%;
    margin-bottom: -52%;
    clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
    transform: scale(1);
    transition: all .25s;
}

.about-section .gallery .wrapper img:nth-child(7n + 1) {
    grid-column: 2 / span 2;
}

.about-section .gallery .wrapper img:hover {
    z-index: 2;
    transform: scale(2);
}

@media (max-width: 768px) {
    .about-section .about-content img {
        width: 250px;
    }

    .about-section .gallery .wrapper img:hover {
        transform: scale(2.5);
    }
}

@media (max-width: 576px) {
    .about-section .about-content img {
        width: inherit;
    }

    .about-section .about-content {
        display: block;
    }

    .about-section .about-content .about-content-text {
        padding-left: 0px;
    }

    .about-section .gallery {
        padding: 50px 0px;
    }

    .about-section .gallery .wrapper img {
        max-width: 100%;

    }

    .about-section .gallery .wrapper {
        grid-gap: 2vmin;
    }

    .about-section .gallery .wrapper img:hover {
        transform: scale(2);
    }

}
</style>