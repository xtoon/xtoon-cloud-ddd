apiVersion: apps/v1
kind: Deployment
metadata:
  name: {APP_NAME}-deployment
  labels:
    app: {APP_NAME}
spec:
  replicas: 2
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
  selector:
    matchLabels:
      app: {APP_NAME}
  template:
    metadata:
      labels:
        app: {APP_NAME}
    spec:
      terminationGracePeriodSeconds: 0
      containers:
      - name: {APP_NAME}
        image: {IMAGE_URL}:{IMAGE_TAG}
        ports:
        - containerPort: 10000
        livenessProbe:
          initialDelaySeconds: 300   #延迟加载时间
          periodSeconds: 5          #重试时间间隔
          timeoutSeconds: 10        #超时时间设置
          httpGet:
            port: 10000
            path: /actuator/health
        env:
          - name: SPRING_PROFILES_ACTIVE
            value: {SPRING_PROFILE}