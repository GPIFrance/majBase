<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>MajBase</title>
    <script src="js/jquery-2.2.4.min.js"></script>
    <link rel="stylesheet" href="css/semantic.min.css">
    <script src="js/semantic.min.js"></script>
    <style type="text/css">
        body > .grid {
            height: 100%;
        }

        .column {
            max-width: 450px;
        }
    </style>
</head>
<body>
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <h1 class="ui image header">Mise à jour des champs d'une base de données</h1>
        <form class="ui large form">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="file icon"></i>
                        <input type="text" name="file" placeholder="Fichier de description" value="structure.php">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="server icon"></i>
                        <input type="text" name="host" placeholder="Host">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="user" placeholder="User">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="text" name="password" placeholder="Password">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="database icon"></i>
                        <input type="text" name="base" placeholder="Base name">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="plug icon"></i>
                        <input type="text" name="port" placeholder="Port" value="3306">
                    </div>
                </div>
                <button name="maj" class="ui fluid large button" type="submit">Mettre à jour</button>
            </div>
            <div class="ui error message"></div>
            <div class="ui negative hidden message" style="text-align: left;">
                <i class="close icon"></i>
                <div class="header"></div>
                <p></p>
            </div>
        </form>
    </div>
</div>
<div id="modal_testConnect" class="ui basic modal">
    <div class="header">
        Connexion
    </div>
    <div class="image content">
        <div class="image">
            <i class="database icon"></i>
        </div>
        <div class="description">
            <p id="modal_testConnect_description"></p>
        </div>
    </div>
    <div class="actions">
        <div class="two fluid ui inverted buttons">
            <div class="ui positive basic inverted button">
                <i class="checkmark icon"></i>
                Mettre à jour
            </div>
            <div class="ui negative basic inverted button">
                <i class="remove icon"></i>
                Annuler
            </div>
        </div>
    </div>
</div>
<div id="modal_update" class="ui basic modal">
    <div class="header">
        Mise à jour
    </div>
    <div class="image content">
        <div class="image">
            <i class="database icon"></i>
        </div>
        <div class="description">
            <p id="modal_update_description"></p>
        </div>
    </div>
    <div class="actions">
        <div class="ui inverted buttons">
            <div class="ui positive basic inverted button">
                <i class="checkmark icon"></i>
                OK
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var $form = $('.ui.form');
        // Initialisation de la validation du formulaire
        $form.form({
            fields: {
                host: {
                    identifier: 'host',
                    rules: [{
                        type: 'empty',
                        prompt: 'Merci de saisir un host'
                    }]
                },
                user: {
                    identifier: 'user',
                    rules: [{
                        type: 'empty',
                        prompt: 'Merci de saisir un user'
                    }]
                },
                password: {
                    identifier: 'password',
                    rules: [{
                        type: 'empty',
                        prompt: 'Merci de saisir un password'
                    }]
                },
                base: {
                    identifier: 'base',
                    rules: [{
                        type: 'empty',
                        prompt: 'Merci de saisir une base'
                    }]
                }
            },
            onSuccess: function (e, fields) {
                // On arrête le comportement par défaut du formulaire
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "_testConnect.php",
                    dataType: "json",
                    data: {
                        host: fields.host,
                        user: fields.user,
                        pass: fields.password,
                        name: fields.base,
                        port: fields.port
                    },
                    success: function (data) {
                        if (data.success) {
                            $('#modal_testConnect_description').html("Connexion à la base de données <" + $form.form('get value', 'host') + "> réussite");
                        } else {
                            $('#modal_testConnect_description').html(data.error);
                        }
                        $('#modal_testConnect').modal({
                            onApprove: function () {
                                // On indique que le formulaire est en cours de traitement
                                $form.addClass('loading');
                                $.ajax({
                                    url: "_updateFields.php",
                                    type: "POST",
                                    dataType: "json",
                                    data: {
                                        host: fields.host,
                                        user: fields.user,
                                        pass: fields.password,
                                        name: fields.base,
                                        structure: fields.file,
                                        port: fields.port
                                    },
                                    success: function (data) {
                                        if (data.success) {
                                            if (data.data == "") {
                                                $('#modal_update_description').html("La base de donnée est  déjà à jour");
                                            } else {
                                                $('#modal_update_description').html("La base de donnée à été mise à jour<br/>" + data.data);
                                            }
                                        } else {
                                            $('#modal_update_description').html(data.error);
                                        }
                                        $('#modal_update').modal("show")
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        console.error(jqXHR, textStatus, errorThrown);
                                        $('#modal_update_description').html(jqXHR.responseText);
                                        $('#modal_update').modal("show")
                                    },
                                    complete: function () {
                                        $form.removeClass('loading');
                                    }
                                });
                            }
                        }).modal("show");
                    },
                    error: function (jqXHR) {
                        console.error(jqXHR);
                        $('#modal_update_description').html(jqXHR.responseText);
                        $('#modal_update').modal("show")
                    }
                });
            }
        });
        // Initialisation pour la fermeture du message d'erreur
        $('.message .close').on('click', function () {
            $(this)
                .closest('.message')
                .transition('fade');
        });
    });
</script>
</body>
</html>