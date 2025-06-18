# Платформонезависимость - тест

1. Проверяем, что alchemist действительно платформонезависимый - [goldens_platform_dependency_alchemist_test.dart](goldens_platform_dependency_flutter_test.dart).
2. Проверяем, что нельзя было обойтись Ahem шрифтом во Flutter - [goldens_platform_dependency_flutter_test.dart](goldens_platform_dependency_alchemist_test.dart).

Файлы сгенерированы на MacOS, а CI выполняется на Linux.

Настройка CI в [tests_ci_platform_dependency.yml](./../../.github/workflows/tests_ci_platform_dependency.yml).

Чтобы CI был зеленым, сейчас там отключен шаг с Flutter, но можно его раскомментировать, чтобы убедиться во втором тезисе.

