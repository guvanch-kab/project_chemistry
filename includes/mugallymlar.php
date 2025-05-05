
  <style>


    .teacher-wrapper {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
    }

    .teacher-card {
      display: flex;
      flex-direction: row;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      max-width: 540px;
      width: 100%;
      transition: transform 0.3s ease;
    }

    .teacher-card:hover {
      transform: translateY(-5px);
    }

    .teacher-image {
      width: 220px;
      height: 180px;
      object-fit: cover;
      margin: 15px;
      border-radius: 12px;
    }

    .teacher-content {
      padding: 15px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .teacher-content h5 {
      margin: 0;
      color: #0056b3;
      font-size: 18px;
    }

    .teacher-content small {
      color: #6c757d;
      margin: 5px 0;
      display: block;
    }

    .teacher-content p {
      margin: 0;
      font-size: 16px;
      color: #444;
    }

    @media (max-width: 576px) {
      .teacher-card {
        flex-direction: column;
        text-align: center;
        align-items: center;
      }

      .teacher-image {
        margin: 15px 0 0;
      }

      .teacher-content {
        padding: 15px;
      }
    }
  </style>


  <div class="teacher-wrapper">
    <!-- Öğretmen 1 -->
    <div class="teacher-card">
      <img src="includes/images/mugallym1.jpg" alt="Öğretmen 1" class="teacher-image">
      <div class="teacher-content">
        <h4>Mamedow Tayr Kurbandurdyýewiç</h4>
        <small>Seýitnazar Seýdi adyndaky Türkmen döwlet mugallymçylyk instituty</small>
        <p>Himiýa we ony okatmagyň usulyýeti kafedrasynyň uly mugallymy.</p>
      </div>
    </div>

    <!-- Öğretmen 2 -->
    <div class="teacher-card">
      <img src="includes/images/mugallym2.jpg" alt="Öğretmen 2" class="teacher-image">
      <div class="teacher-content">
        <h4>Maral Amanowa</h4>
        <small>Seýitnazar Seýdi adyndaky Türkmen döwlet mugallymçylyk instituty</small>
        <p>Himiýa we ony okatmagyň usulyýeti kafedrasynyň dosenti, himiýa ylymlarynyň kandidaty</p>
      </div>
    </div>
  </div>

